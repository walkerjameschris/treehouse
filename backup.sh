#!/bin/bash
# This ensures the backup script will *halt* if
# any one command fails (stopping Docker) preventing data corruption
set -e

# Find already-mounted external drives (excluding your RAID)
mapfile -t drives < <(findmnt -n -o TARGET | grep -E "^/(media|mnt)/" | grep -v "raid")

# Halt if no backup drives are found
if [ ${#drives[@]} -eq 0 ]; then
    echo "Error: No external drives found mounted under /media or /mnt!"
    exit 1
fi

# Make selection and assign to BACKUP_DRIVE variable
echo "Available backup drives:"
select BACKUP_DRIVE in "${drives[@]}"; do
    [ -n "$BACKUP_DRIVE" ] && break
    echo "Invalid selection. Please try again."
done

# Print the drive we selected
echo "Using backup drive: $BACKUP_DRIVE"

# Ensure the backup drive is formatted as ext4
if [ "$(findmnt -n -o FSTYPE -T "$BACKUP_DRIVE")" != "ext4" ]; then
    echo "Error: $BACKUP_DRIVE is not formatted as ext4!"
    exit 1
fi

# Halt all Docker images
(cd immich/ && docker compose down)
(cd lab/ && docker compose down)
(cd memos/ && docker compose down)

# Begin backup
rsync -av --delete --info=progress2 --exclude="lost+found" /mnt/raid/ "$BACKUP_DRIVE"

# Restart Docker images
(cd immich/ && docker compose up -d)
(cd lab/ && docker compose up -d)
(cd memos/ && docker compose up -d)

# Ensure all buffered disk writes are physically flushed
echo "Syncing disk caches..."
sync

# Unmount backup drive for safe removal
umount "$BACKUP_DRIVE"

# Backup successful
echo "Success!"

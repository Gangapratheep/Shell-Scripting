To **list all users in a specific group** on a Linux system, you have a few different options depending on how groups are defined and managed. Here's a complete guide:

---

### ✅ 1. **Using `getent` (recommended for all setups)**

```bash
getent group <groupname>
```

**Example:**

```bash
getent group sudo
```

**Output Example:**

```
sudo:x:27:ubuntu,ganga
```

> The users listed at the end (`ubuntu,ganga`) are members of the group `sudo`.

---

### ✅ 2. **Using `/etc/group` directly (works on most systems)**

```bash
grep '^<groupname>:' /etc/group
```

**Example:**

```bash
grep '^sudo:' /etc/group
```

---

### ✅ 3. **List all groups a user belongs to**

If you want to see which groups a specific user is part of:

```bash
groups <username>
```

**Example:**

```bash
groups ganga
```

---

### ✅ 4. **List all users and their groups (one-liner)**

```bash
cut -d: -f1 /etc/passwd | xargs -n1 groups
```

> This lists every user and their group memberships.

---

### Summary Table

| Task                         | Command                                       |
| ---------------------------- | --------------------------------------------- |
| List users in a group        | `getent group <groupname>`                    |
| Search `/etc/group` manually | `grep '^groupname:' /etc/group`               |
| List groups for a user       | `groups <username>`                           |
| List all users and groups    | `cut -d: -f1 /etc/passwd \| xargs -n1 groups` |

Let me know if you want to list all groups with all their members in a structured format (e.g., JSON or table).


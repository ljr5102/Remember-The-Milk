# Schema Information

## tasks
column name        | data type | details
-------------------|-----------|-----------------------
id                 | integer   | not null, primary key
owner_id           | integer   | not null, foreign key (references users), indexed
name               | string    | not null
completed          | boolean   | not null, default: false
start_date         | date      |
due_date           | date      |
priority           | integer   |
estimate           | string    |
list_id            | integer   | foreign key (references lists), indexed
location_id        | integer   | foreign key (references locations), indexed
image_file_name    | string    |
image_content_type | string    |
image_file_size    | integer   |
image_updated_at   | datetime  |

## lists
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
creator_id  | integer   | not null, foreign key (references users), indexed, unique
name        | string    | not null, indexed, unique [creator_id]

## locations
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
creator_id  | integer   | not null, foreign key (references users), indexed
name        | string    | not null, indexed, unique [creator_id]
address     | string    | not null
lng         | float     |
lat         | float     |

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email_address   | string    | not null, indexed, unique
username        | string    | not null, indexed, unique
password_digest | string    | not null
session_token   | string    | not null, indexed, unique
uid             | string    |
provider        | string    |

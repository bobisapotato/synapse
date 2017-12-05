/* Copyright 2017 New Vector Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

-- users' optionally backed up encrypted e2e sessions
CREATE TABLE e2e_room_keys (
    user_id TEXT NOT NULL,
    room_id TEXT NOT NULL,
    session_id TEXT NOT NULL,
    version INT NOT NULL,
    first_message_index INT,
    forwarded_count INT,
    is_verified BOOLEAN,
    session_data TEXT NOT NULL
);

CREATE UNIQUE INDEX e2e_room_keys_user_idx ON e2e_room_keys(user_id);
CREATE UNIQUE INDEX e2e_room_keys_room_idx ON e2e_room_keys(room_id);
CREATE UNIQUE INDEX e2e_room_keys_session_idx ON e2e_room_keys(session_id);

-- the versioning metadata about versions of users' encrypted e2e session backups
CREATE TABLE e2e_room_key_versions (
    user_id TEXT NOT NULL,
    version INT NOT NULL,
    algorithm TEXT NOT NULL,
    dummy_session_data TEXT NOT NULL
);

CREATE UNIQUE INDEX e2e_room_key_user_idx ON e2e_room_keys(user_id);

#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /rails_project/tmp/pids/server.pid

bundle install
rake db:create
rake db:migrate


exec "$@"

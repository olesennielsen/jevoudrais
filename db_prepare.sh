#!/bin/bash
rake db:drop
rake db:migrate
rake db:seed
rails s
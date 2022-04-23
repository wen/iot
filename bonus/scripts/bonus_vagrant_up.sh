#!/bin/bash

HOST_IP=$(hostname -I | cut -d " " -f1) vagrant up

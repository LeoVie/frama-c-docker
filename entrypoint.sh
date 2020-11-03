#!/bin/sh
eval $(opam env)
exec "$@"

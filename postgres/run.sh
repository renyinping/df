docker pull postgres:10

name=pgdb
pwd=postgres
dir=/srv/dev-disk-by-label-SHARE/postgres

docker run \
    --name $name \
    -p 5432:5432 \
    -e POSTGRES_PASSWORD=$pwd \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v $dir:/var/lib/postgresql/data \
    -d postgres:10


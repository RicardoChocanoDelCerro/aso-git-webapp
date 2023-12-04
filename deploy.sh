#!/bin/bash

PROJECT_ID="ampliacionso"
NOMBRE_DEL_SERVICIO="webapp"
NOMBRE_DE_LA_IMAGEN="webapp"
IMAGEN_DEL_CONTENEDOR="europe-west1-docker.pkg.dev/$PROJECT_ID/$NOMBRE_DEL_SERVICIO/$NOMBRE_DE_LA_IMAGEN:latest"

echo Identificador del proyecto de GCP: $PROJECT_ID
echo Nombre del servicio de cloud run: $NOMBRE_DEL_SERVICIO
echo Nombre de la imagen en GCP: $IMAGEN_DEL_CONTENEDOR

# Construir la nueva imagen
gcloud builds submit webapp --tag=$IMAGEN_DEL_CONTENEDOR

gcloud run deploy $NOMBRE_DEL_SERVICIO \
    --image=$IMAGEN_DEL_CONTENEDOR \
    --platform=managed \
    --region=europe-west1 \
    --allow-unauthenticated \
    --set-env-vars=CLIENT_NAME=Ricardo,IS_REDIS_AVAILABLE=False,VERSION=5,DEBUG=True

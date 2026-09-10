# Base image  (Stage-1)
FROM node:16 AS Build

# WORKING DIR
WORKDIR /app

# Copy dependency 

COPY package*.json ./

#Run build

RUN npm install

# COPY full content

COPY . .

RUN npm run build

# Stage 2 - Serve Static Files
FROM nginx:alpine

# Copy from stage 1 build artifact 

COPY --from=Build /app/build /usr/share/nginx/html

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]

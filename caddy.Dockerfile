# Use the official Caddy image
FROM caddy:2.7-alpine

# Copy the Caddyfile into the container
# Caddy will automatically pick up this Caddyfile if it's in /etc/caddy/
COPY Caddyfile /etc/caddy/Caddyfile

# Expose ports for HTTP and HTTPS
# Caddy automatically handles redirection from HTTP to HTTPS if a domain is specified
EXPOSE 80
EXPOSE 443

# You can also expose other ports if Caddy is configured to listen on them
# EXPOSE 2019 # Caddy's admin API port (optional)

# The default command for the Caddy image is `caddy run --config /etc/caddy/Caddyfile --adapter caddyfile`
# which is what we want. So, no CMD or ENTRYPOINT override is needed unless
# you have specific requirements.

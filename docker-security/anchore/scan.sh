. ./set-env.sh

# Pull down latest feed
anchore-cli system feeds list
anchore-cli system wait

# Scan Odoo version being used
anchore-cli image add odoo:13.0
anchore-cli image wait  odoo:13.0

# Get the list of vulnerabilities
anchore-cli image vuln odoo:13.0 os > ../../reports/acnhore.txt

./inline_scan.sh analyze -u $ANCHORE_CLI_USER -p $ANCHORE_CLI_PASS -r $ANCHORE_CLI_URL -f ~/git/OdooDocker/Dockerfile -g esdc/odoo:13.0-latest
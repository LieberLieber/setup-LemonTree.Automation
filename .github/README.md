Github Action to Deploy LemonTree.Automation
==================================
This allows you to deploy LieberLieber.Automation for Sparx Systems Enterprise Architect to your Github Actions in an easy manor!
To buy a license contact welcome@lieberlieber.com

      - name: GetLTA
        uses: LieberLieber/setup-LemonTree.Automation@v0.1
        id: GetLTA
        with:
          License: ${{secrets.LTALICENSE}}

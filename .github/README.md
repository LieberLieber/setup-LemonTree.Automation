Github Action to Deploy LemonTree.Automation
==================================
This allows you to deploy LieberLieber LemonTree.Automation for Sparx Systems Enterprise Architect Models to your Github Actions in an easy way!<br />
LemonTree.Automation is the commandline Version for CI/CD of our widely known LemonTree 3-way diff and merge tool!
Product Webpage: https://www.lieberlieber.com/lemontree/<br />
To claim a trial or buy a license contact welcome@lieberlieber.com

      - name: GetLTA
        uses: LieberLieber/setup-LemonTree.Automation@v0.1
        id: GetLTA
        with:
          License: ${{secrets.LTALICENSE}}

Simple Example Workflow: https://github.com/LieberLieber/setup-LemonTree.Automation/actions/workflows/TestGetLemonTreeAutomationAction.yml<br />
Many more Workflow Examples: https://github.com/LieberLieber/LemonTree.Automation.Workflows/<br />

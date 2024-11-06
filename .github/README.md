Github Action to Deploy LemonTree.Automation
==================================
This allows you to deploy LieberLieber LemonTree.Automation for Sparx Systems Enterprise Architect Models to your Github Actions in an easy way!<br />
LemonTree.Automation is the commandline Version for CI/CD of our widely known LemonTree 3-way diff and merge tool!<br />
Product Webpage: https://www.lieberlieber.com/lemontree/<br />
To claim a trial or buy a license contact welcome@lieberlieber.com 

      # download Lemontree.Automation on a runner and setup the license
      - name: GetLTA
        uses: LieberLieber/setup-LemonTree.Automation@v6
        id: GetLTA
        with:
          License: ${{secrets.LTALICENSE}} 
      #ExeLocation &"${{steps.GetLTA.outputs.LemonTreeAutomationExecutable}}"
      
      # first simple use of LemonTree.Automation
      - name: ConsistencyCheck
        run: |
          &"${{steps.GetLTA.outputs.LemonTreeAutomationExecutable}}" ConsistencyCheck --Model "model.qeax"

Simple Example Workflow: https://github.com/LieberLieber/setup-LemonTree.Automation/actions/workflows/TestGetLemonTreeAutomationAction.yml<br />
Many more Workflow Examples: https://github.com/LieberLieber/LemonTree.Automation.Workflows/<br />

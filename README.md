Building cloudformation from scratch
---

1. Execute ``network`` stack and check the output for ``VpcId`` and ``PublicNetZoneA``.
2. Execute ``sgfm`` stack and set the parameter:
    * ``VpcId`` - from ``network`` stack output.
    * ``FollowMeIpAddress`` - which is the IP of your local computer from which you make the deployment. This will 
        ensure that you can access all required resources.
3. Execute ``core`` stack and set parameters:
    * ``FollowmeSecurityGroup`` - from ``sgfm`` output.
    * ``PublicNetZoneA`` - from ``network`` output.
4. Execute ``cluster`` stack and set parameters:
    * ``VpcId`` - from ``network`` stack output.
    * ``PublicNetZoneA`` - from ``network`` output.
    * ``SpotPrice`` - proper spot price based on instance type.
    * ``MasterIP`` - private IP of the ``core`` instance.

    
Services use to encode base64 
---
* https://www.base64encode.org/
* http://textmechanic.co/Line-Length-Breaker.html

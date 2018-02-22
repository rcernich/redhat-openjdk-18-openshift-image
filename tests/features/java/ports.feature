@redhat-openjdk-18/openjdk18-openshift @jboss/openjdk18-openshift
Feature: Openshift OpenJDK port tests

  Scenario: Check ports are available
    Given s2i build https://github.com/jboss-openshift/openshift-quickstarts from undertow-servlet
    Then check that port 8080 is open
    Then check that port 8778 is open
    Then inspect container
       | path                    | value       |
       | /Config/ExposedPorts    | 8080/tcp    |
       | /Config/ExposedPorts    | 8443/tcp    |
       | /Config/ExposedPorts    | 8778/tcp    |

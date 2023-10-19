# routingv2

The project implement go_router for navigation

# Requirement
To use
- nested routes
- shell routes
- path parameter
- query parameter

## Routes requirement
  Bottom navigation bar
  - Screen 1
    - Main list 1
      - Sub list
        - item info
    - Main list 2  
  - Screen 2
  - Screen 3



## Learnings
1. The root route of the ShellRoute can't have parentNavigation key

>  route.parentNavigatorKey == null || route.parentNavigatorKey == navigatorKey
> "sub-route's parent navigator key must either be null or has the same navigator key as parent's key"

2. go vs push
go: builds all the sub-routes
push: pushes the page on top of current stack without changing url

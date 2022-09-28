# phase-space
Just small project with fluid based approach to visualize phase space of system of ordinary differential equations.

# Usage:
Download [Processing](https://processing.org/download) and open folder with that file. **Imporant note!** A folder must have the same name as a file from that repo as it is required by Processing. You may use many comented examples to understand how to use it.

For example, to visualize equation:
```
x' = x + y
y' = x - y
```
you may write:
```java
points[i].force(x + y, x - y);
```
As force function is additive, you may rewrite previous function like:
```java
points[i].force(x, x);
points[i].force(y, -y);
```

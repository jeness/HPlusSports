# H+ Sport application
## Implement Model -> View -> Controller(MVC) architecture:
1. View - JSP or HTML files
2. Controller - servlet classes that intercept request and prepare response
3. Model - data access object (DAO) classes that talk to the database

## MySQL as the db
Schema name: Hplus 
tables:
Users - to store all user information
Products - to store all product-related information
Orders - to store order history of a particular user

## Types of HTTP Requests
1. GET - gets information from server
2. POST - processes information on server
3. PUT - uploads a resource on server
4. DELETE - deletes a resource on server
5. HEAD - same as GET, but returns only the headers
6. OPTIONS - helps trace what HTTP methods work on server

## GET Request - get info from server
+ Use to get info form server, can be image, text, video and audio
+ Data sent along is a query string visible in URL; hence, insecure
+ Data limit 8KB, with a few caveats
+ Idempotent(幂等的) - would not change anything on server side if request is sent out multiple times

### Search Use Case: Steps
+ HTML -> Servlet -> DAO -> Database
+ Write a SearchServlet class with the doGet method
+ Collect serach string entered by user and pass to the ApplicationDao class
+ Add method for searching products in ApplicationDao class, which returns all products to calling methods
+ Build the method in SearchServlet, which reads the entire searchResults.html file, read the HTML as a String
+ Assign proper attributes to the form element on HTML

## POST Request - process/post info on server
+ Another HTTP request type
+ Used to post/process information
+ Typically used to modify data into a data store
+ For example, register on a website or checking out a shopping cart
+ Request data is sent in a separate, secure component 
+ POST Request is nonidempotent

### POST case: Register User
+ An action on JSP/HTML -> Servlet -> Dao -> Database
+ Write RegisterUserServlet class with the doPost method, collect all form data and pass to the DAO layer
+ Write a method in ApplicationDao to insert user data
+ Construct and send an information message back to browser from RegisterUserServlet
+ Write message back to the client
+ Assign proper attributes to the form element on HTML

## Forwarding in Servlets
![Forwarding in servlets.png](images/Forwarding_in_servlets.png)
- Clients display the html to user
- Servlet processes the request from client and send to DAO.
- DAO talks to database.
- DAO get the result from db and send back to servlet.
- Servlet writes response to the client.
- When a request reach at one Servlet, because the funcionality is crossing  different Servlet, then after the Servlet does what it is supposed to do, then it will go to other servlet to get the answer. 
- In other cases, a servlet can also forward the entire request to a JSP.

### RequestDispatcher API
- Get RequestDispatcher API on HTTPServletRequest API
- RequestDispatcher.forward to hand over request control to another resource
- RequestDispatcher.include to include response of current and included resource

### ServletConfig API
- Each servlet has its own ServletConfig instance

### ServletContext API
- Used to pass configuration information for the entire application
- Init parameters defined in the deployment descriptor file under the <context-param> element
- Parameters are key-value pairs and always of type String
- One ServletContext instance per application
### HTTPServletRequest Object
- Extends the ServletRequest API and provides all request information to HTTP servlets
- Contains headers and data
- Important API calls: 
`request.getSession`, `request.getHeader(String headerName)`
`request.getRequestURI()`, `request.getParameter(String param)`
`request.getCookies()`, `request.getMethod()`
### HTTPServletResponse Object
- Extends the ServletResponse API and represents the response to client
- Contains headers and data
- Important API calls
`response.sendRedirect(String url)`,`response.addCookie(Cookie cookie)`,
`response.encodeURL(String url)`, `response.setContentType(String contentType)`,
`response.getStatus()`, `response.getWriter()`
The response Object, like the request object, it also has headers and body. 
Body is exactly the place where all the response that have written out from teh servlet sits in,
whereas the headers contain the extra info, like the content type, etc.

## Scopes in a Web App
- Components talk to each other by sharing information
- Information stored in scope object in the form
- Four scopes
1. Request - HTTPServletRequest or ServletRequest
This scope is alive until the response of this request goes back to the client. So information can be store in this request scope in the form of an atrribute, and the information of the attribute is a key-value pair.
2. Session - HTTPSession
3. Context(application) - ServletContext
4. Page - JSPContext

### Parameters vs Attributes
| Parameters                   | Attributes                 |
|------------------------------|----------------------------|
| Return only String values    | Returns objects            |
| Cannot be set in scopes      | can be set in scopes       |
| getParameter("name")         | getAttribute("name")       |
| can be configured in web.xml | setAttribute("name", name) |

### Servlet Life Cycle
![Servlet_life_cycle](images/servlet_life_cycle111.png)
- Init method only can be called once. Usually used for db connection.
- Service method is to delegate the call to doGet or doPost methods
- Destroy method is to clean up activity, when shut down the server.

When multiple requests comming for the same servlet, the steps in red color will be happend again for the repeated requests.

Servlet requests come in the application are multithreaded and run in parallel for the concurrent requests.

init method can be override, destory method can be override,
But service method must not be override.

In practical project, db connection uses connection pool to make user make connections to the db.

# JavaServer Pages(JSP)
- Problems with HTML pages
    + Allows to render static data only
    + I/O operation to read and write HTML template back is time-consuming process
    + Stuffing all HTML with CSS code directly inside servlet is tedious
    + Specialized UIdevelopers may not be equipped to handle servlet code
## JSP features
- JSP excuted on server side and rendered to client side
- can work with a scripting language
![jspfeature](images/jspfeatures.png)
- jsp file = HTML + java translation to .java compilation to loginServlet.class
![jspfile](images/jspfile.png)

- Scriptlet: <% %> - helps write Java statements on JSP
- Expression: <%= %> - helps evaluate expressions on JSP
- Declaration: <%! %> - helps declare variables and methods in a page's scripting language; code goes as seperate method in translated servlet file
### JSP Life Cycle
![jsp Life cycle](images/jspLifeCycle.png)
When the second request comes, it will directly call the jspService method.
### JSP Directives
- Special instructions to container for translation process
- They do not appear as output
- Examples: Import class for the code written on JSP, divise error pages for the application(when error happends, show 404 page, include jsp dynamically)
- In page directives`<%@ page%>` , import is the only directive can be used multiple times, other page directives can be used only once.
- Include directives: `<%@include%>` allows inclusion of JSP resource
### Implicit Objects in JSP
- Objects already created on JSP with predefined
    out: helps write output to JSP - JSPWriter
    request: request for the JSP page - HTTPServletRequest
    response: response for the JSP page - HTTPServletResponse
    session: session object for the user logged in - HTTPSession
    config: represents Servlet Config object
    application: represents ServletContext object
    exception: represents exception and can be used on error pages
    pageContext: contains a reference to all implicit objects and can be used to access information of the page
    
## HTTP has limitation
- HTTP is a stateless protocol, it does not remember the user's info when they add things to the shopping cart
![http limitatain](images/httplimitation.png)
### solution
- Store user info in database upon first request - time-consuming process
- EJB session bean implementation
- Servlet specification has HTTPSession API for session tracking
- Server sets up session ID to uniquely track every user's information
- Session ID exchange by cookies or URL rewriting(send request and respond with the same session id)
![cookies](images/cookies.png)
### Session management using cookies
- Write a servlet class for session management
- Get the HTTPSession objet on the HTTPServletRequest API
- Create a list of products for the user cart and keep adding selected product name to the list
- Set the search results to the request object as an attribute
- Add form element attributes on page
### Session ID exchange: URL Rewriting
- Fallback option in case cookies are disabled
- URL rewritten with the session ID appended at the end 
![session_id_url](images/sessionidurl.png)
- Developer to encode all necessary URLs
#### URL Rewriting steps
- Disable cookies in browser
- Set up session in LoginServlet
- Store user information and forward control to home.jsp
- Write ViewProfileServlet and fetch session information to verify
## Filters
- Filter class is reserved for preprocessing and postprocessing of a request
- can dynamically intercept request and response
- promote modularity, reusability and maintainability
- Prossess the power of abruptly terminating the request execution
- Use case : user authentication, logging, encreption and decreption
![filter](images/filter.png)
- `javax.servlet.Filter` interface
- `javax.servlet.FilterConfig` to pass any configuration info to the filter
- `javax.servlet.FilterChain` invokes a chain of filters together with ethe servlet
- doFilter API is the essential call in filter - holds filter logic
![filterchain](images/filterchain.png)
### Filter steps
- Login request -> Servlet -> DAO
- Filter will do authentication and block access to certain servlet URLs(orderHistory, getProfileDetails) in case: malicious user access the URL on a different machine, session itself times out ont the same machine.
- Check the session object for a valid username
- Add the validation method in DAO
- Call DAO method from LoginServlet class
Prepare an error message for invalid user and set it in request; display on JSP
- In the filter class
1. Retrieve the session for sensitive URLs and check for a valid username
2. Redirect to login page in case no user found

## Events in JEE
- Notifications for change in state of certain objects
- They occur at following levels:
Change in ServletContext object(application level)
Change in the HTTPSession object(session level)
Change in the HTTPServletRequest object(request level)
- Events can either be changed in the life cycle or the attributes can be added, removed or replaced in above objects.
### Where can events occur?
- Deploy and undeploy of an application(context)
- Session creation and destruction on login and logout in an application
- Start of request processing
- Attributes added/removed in session, request, or context objects
- Session migration
- Object binding and unbinding itself from session
- Listener classes can be created by inheriting the appropriate interfaces from the 
javax.servlet or javax.servlet.http package
### Listener Use case scenario
- Previous flows
Servlet -> Dao(set up db connection) ->Database
- After listener implementation
Listener(sets up DB connection) -> Servlets retrieve connection -> pass connection to Dao -> database
### Listener Interface
- ServletContextListener
- ServletContextAttributeListener
- HTTPSessionListener
- HTTPSessionAttributeListener
- ServletRequestListener
- HttpSessionBindingListener
### Listener Code steps:
- Write a listener class that implements the javax.servlet.ServletContextListener interface and generate the pair of methods
- Obtain the DB connection object in the contextInitialized method
- Store the connection object in ServletContext as an attribute
- Configure the listener in the deployment descriptor
- Get the DB connection in any of the servlets using the ServletContext object instead of setting up directly in the DAO layer
## JSP Standard Actions
- `<jsp:useBean.../>` helps to instantiate a bean on the JSP or get a bean on JSP in a specified scope
- `<jsp:forward.../>` forwards the control to another resource in the context
- `<jsp:include.../>` includes another resource in the current resource
- `<jsp:getProperty.../>` fetches and displays a value from a JavaBean property
- `<jsp:setProperty.../>` sets a value to a JavaBean property
### JSP standard actions demo steps
- Add a method in DAO to get profile details
- Write the ViewProfile servlet class which collects username and calls DAO layer to fetch profile info
- Store entire user profile info in request object
- Display on JSP using JSP standard actions
## Expression language
### Expressions could be 
- Immediate: evaluate immediately when JSP runs.
Syntax: `${}`, used by JSP
- Deferred: is deferred and evaluates at a later point in time
Syntax: `#{}`, userd by JSF
### Example of Empressions in EL
- JavaBeans data navigation
Not need for target a scope. It will search for all scopes to find the username under the user data
```
${user.age}
${requestScope.nofItems}
${sessionScope.username}
```
- Arithmetic operations
```
${a * 3.14125}
${a div b}
${a/b}
${a % b}
${a mod b}
```
- Relational operations
```
${a*b == 20}, ${a*b eq 20}, ${a*b ne 20}
${a>100}, ${a gt 100}, ${a<20},${a lt 20}, ${a le 100}, ${a<=100}
```
- Logical operations
${(23>=100) and (12<100)}, ${(23>=100) &&(12<100)}
### EL Implicit Objects
- requestScope: map of all attributes of actual HTTPServletRequest impolicit object
- sessionScope: map of all attributes of actual HTTPSession implicit object
- pageScope: map of all page-scoped attributes
- applicationScope: map of all application-scoped attributes
- cookie: maps the cookie object
- param: gets the request parameter, request.getParameter("id") -> ${param.id}
- header: maps a reqeust headers name to a single value, ${header["User-Agent"]}
- headerValues: gets all the request header values in an array
- initParam: helps to get the context init parameters, context.getInitParameter(") -> ${initParam.id}
- pageContext: same as the pageContext implicit object of JSP
- If a predefined scope is not mentioned in expression like ${cart.noOfItems}, then
the system will search the object in all scopes in the following order: page, request, session, application
## JavaServer Pages Standard Tag Library
### JSTL has module for 
- Display data, iteration, conditional statements - core module
- Formatting values, localization, and internationalization - FMT module
- Parsing and manipulating an XML document - XML module
- Querying database with SQL - SQL module(not used today)
### JSTL
- Core module: `<c:name of tag/>`
- XML module: `<x:name of tag/>`
- SQL module: `<sql:name of tag/>`
- FMT module: `<fmt:name of tag/>`
- Each of the modules need to be included independently on the JSP page
### JSTL steps: get order details 
- Write a servlet class for the JSTL demo
- Add a method in ApplicaitonDao class to get order details for the user
- Call the ApplicationDao method form the servlet class and set all data in the request scope and forwrd control to JSP
- Add JSTL JAR to build path
- Add JSTL modules on JSP

## Custom Tag Library
- User-defined JSP element
- Can contain on or more tags bundled together
- A tag library descriptor is an xml dodument. It contains info about a library as a whole and about each tag contained in the library
- Tag library desciptor file names must have the extension .tld and must be packaged in the /WEB-INF/
directory or subdirector of the WAR file
- Custom tag: `<myTags:formatDate.../>`
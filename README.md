# AirBnb Static Rails App

Hello batch #884! Tonight's livecode was long and daunting but hey: we are all here alive and well. 

Let's take a look at why our rails app was bugging: 

At first, this is the code that we had inside routes.rb: 
```
Rails.application.routes.draw  do
	get  'flats', to:  "flats#flats"
	get  'flats/:flat_id', to:  "flats#show"
end
```
And those were the routes rails gave to us according to our routes.rb: 

<img src="https://ik.imagekit.io/kifd4nz2wokt/Screen_Shot_2022-05-23_at_18.17.35_aMiKFYHfy.png?ik-sdk-version=javascript-1.4.3&updatedAt=1653341077678" />

When I tried to build a link_to helper rails was bugging. WHY? 😱

Because my show route doesn't have any particular prefix on it! Look at my terminal screenshot from above: there's no prefix in front of my show action. 

Ruby reads code from top to bottom: so I was building my link_to like this: 

```
<%=  link_to flat["name"], flats_path(flat['id']) %>
```
So rails look for the path flats_path on my routes.rb
Before it even read the flat['id'] he already found a path: 

	/flats
So he stopped reading everything and went straight to my flat's list page. 

The solution is: I can actually give a name to my paths, so that rails doesn't get confused: 
```
Rails.application.routes.draw  do
	get  'flats', to:  "flats#flats"
	get  'flats/:flat_id', to: "flats#show", as:  :flat
end
```

When I write "as: :flat", basically I'm saying that I want my show page to have a different path name. I don't want it to repeat the /flats path anymore. Now it looks like this: 

<img src="https://ik.imagekit.io/kifd4nz2wokt/Screen_Shot_2022-05-23_at_18.17.47_K03kJ_LxA.png?ik-sdk-version=javascript-1.4.3&updatedAt=1653341077834" /> 

And now I can use this new path name I just created to write a proper link_to helper: 

```
<%=  link_to  flat["name"], flat_path(flat['id']) %>
```

I'm grabbing the prefix from my rails routes (flat). 
I am using it to build the "flat_path"
And now I can pass the flat['id'] between parentheses to create a link that will change according to the flat id. 

I know that we haven't seen this yet. But tomorrow is a day full of new rails knowledge and you'll get a better notion at what didn't work out as well tonight! 

Wish you a nice evening, nice rest and I hope I'll see you tomorrow! 😊

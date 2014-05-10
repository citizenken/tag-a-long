// For more information see: http://emberjs.com/guides/routing/


var nearbyEvents = [{
  id: '1',
  title: "Bithday party",
  author: { name: "Ken Petti", imgLink: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash2/t1.0-1/c66.66.828.828/s160x160/395203_10151246193487292_119229346_n.jpg" },
  date: new Date('12-27-2012'),
  excerpt: "There are lots of à la carte software environments in this world. Places where in order to eat, you must first carefully look over the menu of options to order exactly what you want.",
  body: "I want this for my ORM, I want that for my template language, and let's finish it off with this routing library. Of course, you're going to have to know what you want, and you'll rarely have your horizon expanded if you always order the same thing, but there it is. It's a very popular way of consuming software.\n\nRails is not that. Rails is omakase."
}, {
  id: '2',
  title: "Concert",
  author: { name: "Ken Petti", imgLink: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash2/t1.0-1/c66.66.828.828/s160x160/395203_10151246193487292_119229346_n.jpg" },
  date: new Date('12-24-2012'),
  excerpt: "My [appearance on the Ruby Rogues podcast](http://rubyrogues.com/056-rr-david-heinemeier-hansson/) recently came up for discussion again on the private Parley mailing list.",
  body: "A long list of topics were raised and I took a time to ramble at large about all of them at once. Apologies for not taking the time to be more succinct, but at least each topic has a header so you can skip stuff you don't care about.\n\n### Maintainability\n\nIt's simply not true to say that I don't care about maintainability. I still work on the oldest Rails app in the world."
}];

var myEvents = [{
  id: '1',
  title: "Bithday party",
  author: { name: "Ken Petti", imgLink: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash2/t1.0-1/c66.66.828.828/s160x160/395203_10151246193487292_119229346_n.jpg" },
  date: new Date('12-27-2012'),
  excerpt: "There are lots of à la carte software environments in this world. Places where in order to eat, you must first carefully look over the menu of options to order exactly what you want.",
  body: "I want this for my ORM, I want that for my template language, and let's finish it off with this routing library. Of course, you're going to have to know what you want, and you'll rarely have your horizon expanded if you always order the same thing, but there it is. It's a very popular way of consuming software.\n\nRails is not that. Rails is omakase."
}, {
  id: '2',
  title: "Concert",
  author: { name: "Ken Petti", imgLink: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash2/t1.0-1/c66.66.828.828/s160x160/395203_10151246193487292_119229346_n.jpg" },
  date: new Date('12-24-2012'),
  excerpt: "My [appearance on the Ruby Rogues podcast](http://rubyrogues.com/056-rr-david-heinemeier-hansson/) recently came up for discussion again on the private Parley mailing list.",
  body: "A long list of topics were raised and I took a time to ramble at large about all of them at once. Apologies for not taking the time to be more succinct, but at least each topic has a header so you can skip stuff you don't care about.\n\n### Maintainability\n\nIt's simply not true to say that I don't care about maintainability. I still work on the oldest Rails app in the world."
}];

var pendingEvents = [{
  id: '1',
  title: "blah blah",
  author: { name: "bill kettle" },
  date: new Date('12-27-2012'),
  excerpt: "There are lots of à la carte software environments in this world. Places where in order to eat, you must first carefully look over the menu of options to order exactly what you want.",
  body: "I want this for my ORM, I want that for my template language, and let's finish it off with this routing library. Of course, you're going to have to know what you want, and you'll rarely have your horizon expanded if you always order the same thing, but there it is. It's a very popular way of consuming software.\n\nRails is not that. Rails is omakase."
}, {
  id: '2',
  title: "drinks",
  author: { name: "tom hare" },
  date: new Date('12-24-2012'),
  excerpt: "My [appearance on the Ruby Rogues podcast](http://rubyrogues.com/056-rr-david-heinemeier-hansson/) recently came up for discussion again on the private Parley mailing list.",
  body: "A long list of topics were raised and I took a time to ramble at large about all of them at once. Apologies for not taking the time to be more succinct, but at least each topic has a header so you can skip stuff you don't care about.\n\n### Maintainability\n\nIt's simply not true to say that I don't care about maintainability. I still work on the oldest Rails app in the world."
}];



var profile = {
	id: '1',
	name: {firstName: 'Ken', lastName: 'Petti'},
	birthDate: '11/30/1989',
	description: 'This is a description of this person that is 225 characters long. This is an arbitrary number that seems to be long enough to say something but not long enough to be too detailed. This is important, as strangers will see this',
};

Tagalong.Router.map(function() {
	this.resource('profile');
	this.resource('events', function() {
		this.resource('find', function() {
			this.resource('nearbyEvent',  { path: ':nearbyEvent_id' });
		});
		this.resource('pending', function() {
			this.resource('pendingEvent',  { path: ':pendingEvent_id' });
		});
		this.resource('myEvents', function() {
			this.resource('myEvent',  { path: ':myEvent_id' });
		});
	});
});

Tagalong.FindRoute = Ember.Route.extend({
  model: function() {
    return nearbyEvents;
  }
});

Tagalong.PendingRoute = Ember.Route.extend({
  model: function() {
    return pendingEvents;
  }
});

Tagalong.MyEventsRoute = Ember.Route.extend({
  model: function() {
    return myEvents;
  }
});

Tagalong.ProfileRoute = Ember.Route.extend({
  model: function() {
    return profile;
  }
});


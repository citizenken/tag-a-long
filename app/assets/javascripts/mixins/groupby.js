var groupByMethod = Ember.Mixin.create({
  groupBy: function(key) {
    var result = [];
    var object, value;

    this.forEach(function(item) {
      value = item.get ? item.get(key) : item[key];
      object = result.findProperty('value', value);
      if (!object) {
        object = {
          value: value,
          items: []
        };
        result.push(object);
      }
      return object.items.push(item);
    });

    return result.getEach('items');
  }
});

groupByMethod.apply(Array.prototype);
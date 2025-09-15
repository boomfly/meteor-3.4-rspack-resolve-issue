import {Meteor} from 'meteor/meteor'
import {UsersCollection} from '/imports/api/users'

Meteor.methods({
  'Links.find': (userId) ->
    user = await UsersCollection.findOneAsync(userId)
    if not user
      throw new Meteor.Error('User not found')
    user.links = await LinksCollection.find({userId: userId}).fetch()
    return user
})
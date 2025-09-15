import {Meteor} from 'meteor/meteor'
import {LinksCollection} from '/imports/api/links'
import {UsersCollection} from '/imports/api/users'

Meteor.methods({
  'Users.find': (userId) ->
    user = await UsersCollection.findOneAsync(userId)
    if not user
      throw new Meteor.Error('User not found')
    user.links = await LinksCollection.find({userId: userId}).fetch()
    return user
})
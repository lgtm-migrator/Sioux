assert = require( 'chai' ).assert

require './update.coffee'

update_at       = 1
delete_at       = 2
insert_at       = 3
delete_range    = 4
update_range    = 5
edit_at         = 6

describe "PubSub.update", ->

    describe 'given the update operation is empty', ->

        update = ( input )->
            PubSub.update input, []

        it "simply returns the input value", ->
            assert.deepEqual update( [1,2,3] ), [1,2,3]
            assert.deepEqual update( [] ), []
            assert.deepEqual update( {} ), {}
            assert.deepEqual update( {a:1, b:2} ), {a:1, b:2}
            assert.deepEqual update( 1 ), 1
            assert.deepEqual update( "asdasdd" ), "asdasdd"

    describe "given the input is an empty array", ->
        
        update = ( update_instructions )->
            PubSub.update( [], update_instructions )

        describe "and the update operation is an 'update_at'", ->
            it "raises an exception, if the index is negative", ->
                test = -> update [ update_at, -4, 1 ] 

                assert.throw test, RangeError, 'bad index for update: -4'

            it "raises an exception, if the index is greater or equal to the input size", ->
                test = -> update [ update_at, 0, 0 ]

                assert.throw test, RangeError, 'bad index for update: 0'

        describe "and the update operation is an 'delete_at'", ->
            it "raises an exception, if the index is negative", ->
                test = -> update [ delete_at, -4 ] 

                assert.throw test, RangeError, 'bad index for delete: -4'

            it "raises an exception, if the index is greater or equal to the input size", ->
                test = -> update [ delete_at, 0 ]

                assert.throw test, RangeError, 'bad index for delete: 0'

        describe "and the update operation is an 'insert_at'", ->

            it "raises an exception, if the index is negative", ->
                test = -> update [ insert_at, -4, 1 ] 

                assert.throw test, RangeError, 'bad index for insert: -4'

            it 'inserts an element, if the index is 0', ->
                assert.deepEqual update( [insert_at, 0, 17] ), [17]

            it "raises an exception, if the index is greater than the input size", ->
                test = -> update [ insert_at, 1, 1 ]

                assert.throw test, RangeError, 'bad index for insert: 1'

        describe "and the update operation is an 'delete_range'", ->
        describe "and the update operation is an 'update_range'", ->
        describe "and the update operation is an 'edit_at'", ->

    describe "given the input is a not empty array", ->
        update = ( update_instructions )->
            PubSub.update( [ 1, 2, 3, 4 ], update_instructions )

        describe "and the update operation is an 'update_at'", ->
            it "raises an exception, if the index is negative", ->
                test = -> update [ update_at, -1, 1 ] 

                assert.throw test, RangeError, 'bad index for update: -1'

            it "raises an exception, if the index is greater or equal to the input size", ->
                test = -> update [ update_at, 4, 1 ]

                assert.throw test, RangeError, 'bad index for update: 4'

            it "updates the first element", ->
                assert.deepEqual update( [ update_at, 0, 'test' ] ), [ 'test', 2, 3, 4 ]

            it "updates the last element", ->
                assert.deepEqual update( [ update_at, 3, 'test' ] ), [ 1, 2, 3, 'test' ]

            it "updates an element in the middle", ->
                assert.deepEqual update( [ update_at, 1, 'test' ] ), [ 1, 'test', 3, 4 ]

        describe "and the update operation is an 'delete_at'", ->        
            it "raises an exception, if the index is negative", ->
                test = -> update [ delete_at, -14 ] 

                assert.throw test, RangeError, 'bad index for delete: -14'

            it "raises an exception, if the index is greater or equal to the input size", ->
                test = -> update [ delete_at, 4 ]

                assert.throw test, RangeError, 'bad index for delete: 4'

            it 'deletes an element at the beginning', ->
                assert.deepEqual update( [ delete_at, 0 ] ), [ 2, 3, 4 ]

            it 'deletes an element in the middle', ->
                assert.deepEqual update( [ delete_at, 1 ] ), [ 1, 3, 4 ]

            it 'deletes an element at the end', ->
                assert.deepEqual update( [ delete_at, 3 ] ), [ 1, 2, 3 ]

        describe "and the update operation is an 'insert_at'", ->

            it "raises an exception, if the index is negative", ->
                test = -> update [ insert_at, -4, 1 ] 

                assert.throw test, RangeError, 'bad index for insert: -4'

            it 'inserts an element at the beginning', ->
                assert.deepEqual update( [insert_at, 0, 0] ), [ 0, 1, 2, 3, 4 ]

            it 'inserts an element at the end', ->
                assert.deepEqual update( [insert_at, 4, 5] ), [ 1, 2, 3, 4, 5 ]

            it 'inserts an element in the middle', ->
                assert.deepEqual update( [insert_at, 2, 17] ), [ 1, 2, 17, 3, 4 ]

            it "raises an exception, if the index is greater than the input size", ->
                test = -> update [ insert_at, 5, 14 ]

                assert.throw test, RangeError, 'bad index for insert: 5'

        describe "and the update operation is an 'delete_range'", ->
        describe "and the update operation is an 'update_range'", ->
        describe "and the update operation is an 'edit_at'", ->

        describe "and the update operation is incomplete", ->

    describe "given the input is an empty object", ->
        update = ( update_operations )->
            PubSub.update( {}, update_operations )

        describe "and the update operation is an 'update_at'", ->
            xit "raises an exception", ->
                test = -> update 'foo', 3

                assert.throw test, RangeError, "update unknown key: 'foo'"

        describe "and the update operation is an 'delete_at'", ->
        describe "and the update operation is an 'insert_at'", ->
        describe "and the update operation is an 'delete_range'", ->
        describe "and the update operation is an 'update_range'", ->
        describe "and the update operation is an 'edit_at'", ->

    describe "given the input is a not empty object", ->
        describe "and the update operation is an 'update_at'", ->
        describe "and the update operation is an 'delete_at'", ->
        describe "and the update operation is an 'insert_at'", ->
        describe "and the update operation is an 'delete_range'", ->
        describe "and the update operation is an 'update_range'", ->
        describe "and the update operation is an 'edit_at'", ->

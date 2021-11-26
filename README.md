
# Objectives
- Describe the value of isolating unit tests
- Explain how RSpec helps give you tools to do so
- Practice isolating unit tests with RSpec

# Starter (10mins)

Your coach will recap the first mocking workshop and then demonstrate how to implement RSpec test doubles in the first test in `docking_station_spec.rb` in `/exercise1`

# Main (45mins)

## Instructions

There are two specs in each of the exercise directories. In each case, read and try to understand what's happening. **Clear, well-written specs help inform what the intention of the code is.**

1. Don't touch the code in `lib`, only edit the code in the `spec` directory.
2. At every point something is unclear, or there is a word you're unsure of exactly what it does, note it down and spend a few minutes researching with your pair.
3. Create a list of things you've learnt during this workshop.
4. Spend time refactoring the tests.

### Exercise 1 (25mins)

- replace the custom mocks using RSpec's `double` method.
- find a way to control the behaviour of the randomness
- refactor the tests

### Exercise 2 (20mins)

- replace the custom mocks using RSpec's `double` method in this slightly more complex example.
- refactor the tests

# Plenary (15mins)
A group discussion based on reflections on the starter and main.
- what did you learn?
- what felt difficult?
- what do you want more clarity on?

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=skills-workshops&prefill_File=object_oriented_programming/mocking_2/README.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=skills-workshops&prefill_File=object_oriented_programming/mocking_2/README.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=skills-workshops&prefill_File=object_oriented_programming/mocking_2/README.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=skills-workshops&prefill_File=object_oriented_programming/mocking_2/README.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=skills-workshops&prefill_File=object_oriented_programming/mocking_2/README.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->


***NOTES - Exercise 1 / Docking Station***

we have:

mock of two classes :
MockWorkingBike => creates working bikes
MockBrokenBike -> creates broken bikes

# Failure/Error: allow_any_instance_of(DockingStation).to receive(:sample).and_return(working_bike)
       DockingStation does not implement #sample

stubbing sample method => allow(...)

	- @bikes = [] implement #sample (not docking station)
	allow(@bikes).to receive(:sample).and_return(true)

RED ! NoMethodError:undefined method 'ancestors' for []:Array

	-  @bikes is an array so Array class implement # sample
	allow_any_instance_of(Array).to receive(:sample).and_return(true)

RED ! NoMethodError: undefined method 'working?' for true:TrueClass

	- #sample method should return a specific kind of bike:
		or the @broken_bike
		or the @working_bike
	allow_any_instance_of(Array).to receive(:sample).and_return(@working_bike)

GREEN :D all specs passed !


REFACTORING: 
make doubles for our "Mock" classes as they both have the same method
	I want have one class only (Bike - fake use tag 'bike') which has one method working?
	place it at the beginning of the DockingStation describe block

class MockWorkingBike
   def working?
     true
   end
end

becomes => let(:working_bike) { double("bike", working?: true) }

class MockBrokenBike
  def working?
    false
  end
end

becomes => let(:broken_bike) { double("bike", working?: false) }

questions:
we use a symbole in let() why?
we use a normal var in the tests

the stub allow(...) is only valid within an example/it block

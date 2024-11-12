# Peer-Review for Programming Exercise 2 #

## Description ##

For this assignment, you will be giving feedback on the completeness of assignment two: Obscura. To do so, we will give you a rubric to provide feedback. Please give positive criticism and suggestions on how to fix segments of code.

You only need to review code modified or created by the student you are reviewing. You do not have to check the code and project files that the instructor gave out.

Abusive or hateful language or comments will not be tolerated and will result in a grade penalty or be considered a breach of the UC Davis Code of Academic Conduct.

If there are any questions at any point, please email the TA.   

## Due Date and Submission Information
See the official course schedule for due date.

A successful submission should consist of a copy of this markdown document template that is modified with your peer review. This review document should be placed into the base folder of the repo you are reviewing in the master branch. The file name should be the same as in the template: `CodeReview-Exercise2.md`. You must also include your name and email address in the `Peer-reviewer Information` section below.

If you are in a rare situation where two peer-reviewers are on a single repository, append your UC Davis user name before the extension of your review file. An example: `CodeReview-Exercise2-username.md`. Both reviewers should submit their reviews in the master branch.  

# Solution Assessment #

## Peer-reviewer Information

* *name:* Alex Chen
* *email:* yscchen@ucdavis.edu

### Description ###

For assessing the solution, you will be choosing ONE choice from: unsatisfactory, satisfactory, good, great, or perfect.

The break down of each of these labels for the solution assessment.

#### Perfect #### 
	Can't find any flaws with the prompt. Perfectly satisfied all stage objectives.

#### Great ####
	Minor flaws in one or two objectives. 

#### Good #####
	Major flaw and some minor flaws.

#### Satisfactory ####
	Couple of major flaws. Heading towards solution, however did not fully realize solution.

#### Unsatisfactory ####
	Partial work, not converging to a solution. Pervasive Major flaws. Objective largely unmet.


___

## Solution Assessment ##

### Stage 1 ###

- [x] Perfect
- [ ] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
The implementation is perfect. The control works well, and the cross line looks great.

___
### Stage 2 ###

- [x] Perfect
- [ ] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
The implementation is perfect. The camera scrolls smoothly, the vessel is pushed 
when it touches the left side of the box, and the export fields meet all requirements.

___
### Stage 3 ###

- [x] Perfect
- [ ] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
I love the overall control feelling. The implementation is very smooth, and the 
arguments are adjusted perfectly. All code, including the export fields, fully 
meets the requirements.

___
### Stage 4 ###

- [x] Perfect
- [ ] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
Stage 4 is executed very smoothly and perfectly meets all the requirements.
Your code provides a well-balanced, responsive, and smooth camera system 
that aligns with the requirements of the assignment. It gives me an immersive 
camera that feels natural . Each parameter is carefully chosen to create a 
balance between responsiveness, smoothness, and player control.

___
### Stage 5 ###

- [x] Perfect
- [ ] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
Good implementation. All 4 way can being speeding up as required. But your 
controller doesn't draw the push zone border box when draw_camera_logic is true.
___
# Code Style #


### Description ###
Overall you have good comments. 


#### Style Guide Infractions ####

You can reduce some Unnecessary Debug Statements like this: 
https://github.com/ensemble-ai/exercise-2-camera-control-Echo108471/blob/ce19d163dde8527a476c607345e66379c35fb4c3/Obscura/scripts/camera_controllers/lerp_smooth_target_focus.gd#L30
which can influence user experience.

#### Style Guide Exemplars ####
All comments are on their own separate line of code.
Your namings of conventions are perfect in this assignment, and we got the file
name "lerp_position_lock.gd", which follows the GDScript Style Guide.

___

# Best Practices #
You follow the the style guide of the GDScript very well. Logical flow makes your
code straightforward to understand when reading from top to bottom.

## Best Practices Review ##
But in some file your could write more comment like lerp_smooth_target_focus.

#### Best Practices Infractions ####
Honestly, everything is inside of Code Style.

#### Best Practices Exemplars ####
* Good Code Order in pos_lock_lerp_smooth.gd, for me your code order is pretty. And it meet the requirement described in the style guide of the GDScript.

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
The vessel stay in the center on the screen when using the position lock camera, 
with an optional crosshair overlay that can be toggled on or off to precisely 
mark the center of the screen.

___
### Stage 2 ###

- [x] Perfect
- [ ] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
The autoscroll camera box is proportionally designed, with boundaries that can 
be successfully toggled as needed. The vessel is constrained within the 
boundaries of the autoscroll camera box, remaining precisely at the edges when 
attempting to move beyond the defined area. The camera scrolls to the right at 
a constant speed, creating the effect of a stationary target within the box. 

___
### Stage 3 ###

- [x] Perfect
- [ ] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
I love the overall control feelling. This stage successfully fulfills all 
requirements. When stationary, the vessel stay in the center on the screen using 
the position lock functionality. During movement, the camera initially lags 
behind the vessel at a slower speed, matches the vessel's speed once 
it exceeds a defined leash distance, and smoothly catches up when the vessel 
stops. Additionally, a crosshair can be toggled on or off to accurately mark 
bthe center of the camera.

___
### Stage 4 ###

- [x] Perfect
- [ ] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
This stage also meets all requirements. While the vessel is in motion, the 
camera moves ahead of the vessel in the direction of its velocity, initially 
at a faster speed and then matching the vessel's speed once it surpasses a 
defined leash distance. When the vessel stops, the camera pauses for a specified 
delay before smoothly recentering on the vessel. Additionally, a crosshair can 
be toggled on or off to precisely indicate the camera's center.

___
### Stage 5 ###

- [ ] Perfect
- [X] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
This stage successfully fulfills some requirements. The vessel is restricted 
within the boundaries of the outer pushbox, and the camera moves at the vessel's 
speed in the direction of the wall being pushed, including scenarios where two 
walls are pushed simultaneously. When the vessel crosses an inner speedup bound, 
the camera appropriately adjusts its speed to the push ratio multiplied by the 
vessel's speed in the direction of the crossed boundary. Additionally, 
the camera remains stationary when the vessel is fully contained within the 
speedup zone. The proportions of both the outer pushbox and speedup box are 
appropriately configured and can be toggled on or off as needed.

However, you don't have the inner pushbox. And when the vessel is positioned 
between the speedup bound and the outer pushbox boundary, the camera incorrectly 
moves perpendicular to the wall it is near. When the vessel is near the left 
outer boundaries and moves vertically without being in a corner, the camera also 
moves vertically, which is incorrect.

And the pushbox set by you may be too large. The vessel can go outside the screen.
___
# Code Style #


#### Style Guide Infractions ####
Some inconsistent line spaces within functions: [two lines] https://github.com/ensemble-ai/exercise-2-camera-control-Echo108471/blob/799d879f1b516ec71c5e024fa8921208478b2e50/Obscura/scripts/camera_controllers/position_lock.gd#L18
And sometimes you don't have line space between two functions. https://github.com/ensemble-ai/exercise-2-camera-control-Echo108471/blob/799d879f1b516ec71c5e024fa8921208478b2e50/Obscura/scripts/camera_controllers/four_way_push_zone.gd#L18
And maybe you can write more comment for four_way_push_zone.gd.

#### Style Guide Exemplars ####
All comments are on their own separate line of code.
Your namings of conventions are perfect in this assignment, and we got the file
name "lerp_position_lock.gd", which follows the GDScript Style Guide.
Uniform use of indentation.
___


## Best Practices Review ##


#### Best Practices Infractions ####

Maybe you can reduce some Unnecessary Debug Statements like this: 
https://github.com/ensemble-ai/exercise-2-camera-control-Echo108471/blob/ce19d163dde8527a476c607345e66379c35fb4c3/Obscura/scripts/camera_controllers/lerp_smooth_target_focus.gd#L30
which can influence user experience.
And also add some comments for position_lock.gd. I got confused how your draw_logic
function works.
#### Best Practices Exemplars ####
* Good Code Order in pos_lock_lerp_smooth.gd, for me your code order is pretty 
good. And it meet the requirement described in the style guide of the GDScript.
[good exmaple of proper variable naming] https://github.com/ensemble-ai/exercise-2-camera-control-Echo108471/blob/799d879f1b516ec71c5e024fa8921208478b2e50/Obscura/scripts/camera_controllers/pos_lock_lerp_smooth.gd#L28
[Sufficient code comment] https://github.com/ensemble-ai/exercise-2-camera-control-Echo108471/blob/799d879f1b516ec71c5e024fa8921208478b2e50/Obscura/scripts/camera_controllers/pos_lock_lerp_smooth.gd#L28

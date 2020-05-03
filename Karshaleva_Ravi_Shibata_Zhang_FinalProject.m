%% Betina Karshaleva, Rukmini Ravi, Andrew Shibata, and Yuwei Zhang
%% COGS 119
%% How "San Diegan" is Your Speech? An Experiment Looking at Accent Perception
%% Description: 
% Participants are taken through a series of audio files, that are played 
% in a randomized order. For each audio file that is played, each 
% participant needs to indicate whether they think the speaker whose voice 
% is presented through the audio file is a San Diego native or not, by 
% indicating their opinions on the respective accents of  each of the 
% speakers. The participants are provided with "yes" and "no" options to 
% respond to the overarching question - "Does the person sound like they 
% are from San Diego?"
%% Loops through participants
for subj_Number = 1:4 % loops through four participants
    string1 = 'Your subject number is: '; % provides each participant with 
    % subject number 
    string2 = num2str(subj_Number);
    disp(strcat([string1, string2]));
    pause(3);
    % pauses for three seconds before moving on to rest of code

%% Opens up PsychToolbox

[w, wRect] = Screen('OpenWindow', 0, [255 255 255]);
% opens full size screen with white background
% w is windownumber, wRect is dimensions of window; this will be used to
% calculate where text is located

black = [0 0 0];
% value for black text is initialized here

%% PsychToolbox Instruction Screen

instructions = ['You will participate in a study \nwhere you will hear ' ...
    'sentences spoken\nby people either from San Diego or not\nfrom San '... 
    'Diego. Your task is to answer\nwhether they sound like they are ' ...
    'from\nSan Diego or not.\n\nYou will press "q" for "sounding San ' ...
    'Diegan"\n and "p" for "not sounding San Diegan".\n\nPress any key ' ... 
    'to start.'];

DrawFormattedText(w, instructions, 'center', 'center', black);
% ('center' can be changed if screen is no longer full screen)
% displays text in window w, centered horizontally, starting at the 100
% pixel mark, vertically, with color black
   
Screen('Flip', w);
% instructions displayed
    
FlushEvents; % releases all events in the event queue
    
while KbCheck; 
end

% awaits key press from participant

KbStrokeWait;

%% Reads in Audio Files & Randomizes Them Based on Index

% naming convention: 
% speakerNumber_audioFileLetter_nativeEnglishORnon-NativeEnglish

% speaker number corresponds to speaker number indicated on table
% we made on Google docs

% audio file letter corresponds to which audio file each speaker
% recorded first and second - 'a' for first, 'b' for second

% non-native English = 'na', native English = 'ae'

% one_a_na.a = 'one_a_na'; --------------> was deleted!
% one_a_na.b = audioread('1a_na.wav'); --------------> was deleted!
% one_b_na.a = 'one_b_na'; --------------> was deleted!
% one_b_na.b = audioread('1b_na.wav'); --------------> was deleted!

two_a_na.a = 'two_a_na';
two_a_na.b = audioread('2a_na.wav');
two_b_na.a = 'two_b_na';
two_b_na.b = audioread('2b_na.wav');

% three_a_na.a = 'three_a_na'; --------------> was deleted!
% three_a_na.b = audioread('3a_na.wav'); --------------> was deleted!
% three_b_na.a = 'three_b_na'; --------------> was deleted!
% three_b_na.b = audioread('3b_na.wav'); --------------> was deleted!

four_a_na.a = 'four_a_na.wav';
four_a_na.b = audioread('4a_na.wav');
four_b_na.a = 'four_b_na.wav';
four_b_na.b = audioread('4b_na.wav');

five_a_na.a = 'five_a_na.wav';
five_a_na.b = audioread('5a_na.wav');
five_b_na.a = 'five_b_na.wav';
five_b_na.b = audioread('5b_na.wav');

six_a_ae.a = 'six_a_ae';
six_a_ae.b = audioread('6a_ae.wav');
six_b_ae.a = 'six_b_ae';
six_b_ae.b = audioread('6b_ae.wav');

seven_a_ae.a = 'seven_a_ae';
seven_a_ae.b = audioread('7a_ae.wav');
seven_b_ae.a = 'seven_b_ae';
seven_b_ae.b = audioread('7b_ae.wav');

% eight_a_ae.a = 'eight_a_ae'; ------------> was deleted!
% eight_a_ae.b = audioread('8a_ae.wav'); --------------> was deleted!
% eight_b_ae.a = 'eight_b_ae'; --------------> was deleted!
% eight_b_ae.b = audioread('8b_ae.wav'); --------------> was deleted!

nine_a_ae.a = 'nine_a_ae';
nine_a_ae.b = audioread('9a_ae.wav');
nine_b_ae.a = 'nine_b_ae';
nine_b_ae.b = audioread('9b_ae.wav');

% ten_a_ae.a = 'ten_a_ae'; ---------------------> was deleted!
% ten_a_ae.b = audioread('10a_ae.wav'); --------------> was deleted!
% ten_b_ae.a = 'ten_b_ae'; --------------> was deleted!
% ten_b_ae.b = audioread('10b_ae.wav'); --------------> was deleted!

audioarray = {two_a_na, two_b_na, four_a_na, four_b_na, five_a_na, ...
    five_b_na, six_a_ae, six_b_ae, seven_a_ae, seven_b_ae, nine_a_ae, ...
    nine_b_ae};

% saves all audio files to cell array, "audioarray"

orig_indices = randperm(length(audioarray));
% randomizes indices of audioarray and creates vector of random indices

audioarray = cell2mat(audioarray);
% converts cell array into matrix

file_names = repmat({0}, 1, length(audioarray));
% initializes file_names cell array for file names
audio_files = repmat({0}, 1, length(audioarray));
% initializes audio_files cell array for audio files

for i = 1:length(audioarray) % loops through array, "audioarray" 
    file_names{i} = audioarray(orig_indices(i)).a;
    % calls on randomized indices from orig_indices array in consecutive
    % order and assigns to audioarray to get end value - values will keep
    % being added into file_names{i} as loop goes on
    audio_files{i} = audioarray(orig_indices(i)).b;
    % similar process as above, but with audio files
end

%% %% Speaker Struct Development
% hardcodes each speakers' year of residence in SD 

speakers(1).yearsInSD = 0;
speakers(2).yearsInSD = 3;
speakers(3).yearsInSD = 3;
speakers(4).yearsInSD = 14;
speakers(5).yearsInSD = 1;
speakers(6).yearsInSD = 2.5;

for i=1:length(audioarray)
 
    % Prepare for keyboard input
    keyIsDown = 0;
    dispText(w, wRect);
 
    current_audio_file = audioarray(orig_indices(i)).b; 
    % sets up one array in i-th struct of major struct audioarray to be 
    % saved in variable current_audio_file. this array will contain the 
    % "sine wave" that will be played in the current trial of i-th loop
   
    sound(current_audio_file, 44000); 
    % plays current_audio_file at 44000 Hz
    
    pause((length(current_audio_file))/44000);
    % to loop through each file COMPLETELY, each file is paused for 
    % the length of the current_audio_file divided by 44000 Hz,
    % the sample frequency

   while(~keyIsDown)
        [keyIsDown, secs, keycode] = KbCheck; 
        % in while loop, the loop checks whether a key has been pressed -
        % continues displaying the text until the key has been pressed, and 
        % then ends the loop, recording that the key has been pressed 
        % (keyIsDown), and which key has been pressed (keycode)
   end
    
    if keyIsDown % if conditional for keyIsDown
      
      sentenceA = 0; % initializes sentenceA 
    
      % checks which speaker this sentence belongs to with conditional
      if mod(orig_indices(i) , 2) == 0
         index = orig_indices(i) / 2;
      else
         index = (orig_indices(i) / 2) + 0.5;
         sentenceA = 1;
      end
    
      % assigns number of participant to struct
      speakers(index).DATA.info(subj_Number) = subj_Number;
    
      if sentenceA
          speakers(index).DATA.response(subj_Number * 2 - 1) = native2unicode(KbName(keycode), 'ASCII');
          % for sentence a of speaker (index number indicates which
          % speaker), the response of the participant (either q or p) is
          % turned into a ASCII number, which is then converted into a
          % character; there should be two characters for each speaker, and
          % they can be selected individually like so:
                % speakers(1).DATA.response(1)
          
      else
         speakers(index).DATA.response(subj_Number * 2) = native2unicode(KbName(keycode), 'ASCII');
         
      end
      
      if index <= 3 % accounts for Google Docs chart, where speakers 3 and 
          % below are non-native English speakers
          speakers(index).NAAE = 0;
          
      else % all else, is native, American English speaker
          speakers(index).NAAE = 1;
          
      end
      
    end
    
end

sca; % closes PsychToolbox

end

save ('speakersDATA.mat', 'speakers'); % save 'speakers' struct to
% .mat file called 'speakersDATA.mat'

%% Analysis Script

load('speakersDATA.mat');

% Turn 'p' and 'q' into integers
for spk = 1:length(speakers)
   for resp = 1:length(speakers(spk).DATA.response)
       if strcmp(speakers(spk).DATA.response(resp),'p')
           speakers(spk).DATA.response(resp) = 0;
       elseif strcmp(speakers(spk).DATA.response(resp),'q')
           speakers(spk).DATA.response(resp) = 1;
       else
           speakers(spk).DATA.response(resp) = 0;
       end
   end
end


% Find mean rating by speaker
for spk = 1:length(speakers)
   speakers(spk).rating = sum(speakers(spk).DATA.response)/length(speakers(spk).DATA.response); 
end

save ('speakersDATA.mat', 'speakers');
%% Function for Displaying Text in between Audio Files

function []  = dispText(w, wRect)
    % following function displays three pieces of text
        % the primary question, a block containing YES, and a block 
        % containing NO
    % the YES and NO texts are within a blue rectangle
    % underneath YES, it says in smaller font to 'press q' while underneath 
    % NO it says in smaller font to 'press p' 
        % THE ARGUMENTS are as follows:
            % w is the windownumber
            % wRect is the four element array of the screen size
        % OUTPUT is as follows:
            % keyIsDown records whether any key of the keyboard has been
            % pressed - this is in a while loop, as the trial does not end
            % until a key has been pressed - reaction time is not
            % particularly important
            % keycode records WHICH key on the keyboard was pressed
            
%COLORS
    black = [0 0 0];
    % color of text, black

    babyblue = [173 216 240];
    % color of rectangles under text, blue

    darkgray = [139, 137, 139];
    % color of smaller text (press p or q), dark gray

% NEED 2 halves, and need to center text within the two halves
[xcenter, ycenter] = RectCenter(wRect);
    % xcenter is assigned the number corresponding to "one half" of the
    % screen resolution horizontally
    
    % ycenter is assigned the number corresponding to "one half" of the
    % screen resolution vertically
    
  % TEXT COORDINATES
    yes_xstart = (xcenter - 150)/2;
    % x coordinate from which box containing text 'YES' starts

    no_xstart = xcenter + yes_xstart;
    % x coordinate from which box containing text 'NO' starts

    press_ystart = ycenter + 60;
    % y coordinate from which boxes containing text 'PRESS KEY' starts
    % the smaller font 'press q' is 50 underneath the YES text (left),
    % while 'press q' is 50 under the initial NO text (right)

    does_ystart = ycenter/3;
    % y coordinate from which box containing text 'Does the person sound
    % like they are from San Diego?' starts
    
  % RECTANGLE COORDINATES
    
    % YES RECTANGLE
        yesrect_xstart = (xcenter - 300)/2;
        % x coordinate from which RECTANGLE containing text 'YES' starts
        yesrect_xend = yesrect_xstart + 300;
        % x coordinate at which RECTANGLE w/ 'YES' ENDS
        % 300 away from starting position

        yesrect_ystart = ycenter - 100;
        % y coordinate from which RECTANGLE containing text 'YES' starts
        % 100 before the center of the screen (vertically, row-wise)
        yesrect_yend = press_ystart + 100;
        % y coordinate at whcih RECTANGLE w/ 'YES' ENDS
        % 100 away from starting position (this should be taller than the
        % text)

        yesrect = [yesrect_xstart, yesrect_ystart, yesrect_xend, yesrect_yend];
        % ARRAY with all 4 coordiantes built above - will be used in
        % FillRect for YES rectangle (left)


   % NO RECTANGLE
        norect_xstart = xcenter + yesrect_xstart;
        % y coordinate from which RECTANGLE containing text 'NO' starts
        % the distance from which YES rectangle STARTS added to the center
        % coordinate ( half of screen + starting yes rectangle margin)
     
        norect_xend = norect_xstart + 300;
        % y coordinate at which RECTANGLE w/ 'YES' ENDS
        % 300 away from starting position

        norect_ystart = yesrect_ystart;
        % SAME as YES rectangle
        % starts at same level vertically - rectangles  are same size
        
        norect_yend = yesrect_yend;
        % SAME as YES rectangle
        % ENDS at same level vertically - rectangles  are same size

        norect = [norect_xstart, norect_ystart, norect_xend, norect_yend];
        % ARRAY with all 4 coordiantes built above - will be used in
        % FillRect for NO rectangle (right)

% MAKE RECTANGLES
Screen('FillRect', w, babyblue, [yesrect]);  
    % makes blue rectangle on the LEFT for YES text
    
Screen('FillRect', w, babyblue, [norect]);  
    % makes blue rectangle on the RIGHT for NO text
       
% MAKE TEXT    
Screen('TextSize', w, 40);
% LARGE text size for question: Does this person sound like they are from
% SD?

DrawFormattedText(w, 'Does this person sound like they are from San Diego?',...
    'center',...
    does_ystart, black);
    % displays text in window w, in the upper sixth portion of the screen, 
    % but centered horizontally   
    % COLOR is black
    
Screen('TextSize', w, 45);
% LARGE text size for Yes and NO text
    
DrawFormattedText(w, 'Yes', yes_xstart,...
    'center', black);
    %displays text in window w, text is about 200px?
    %YES is on the LEFT side of the screen, centered vertically
    
DrawFormattedText(w, 'No', no_xstart,...
    'center', black);
    % displays text in window w, text is about 200px?
    % NO is on the RIGHT half of the screen, centered vertically
    
    
Screen('TextSize', w, 18);
% smaller font for press q or p text

DrawFormattedText(w, '(press "q")', yes_xstart,press_ystart, darkgray);
% display press q test, dark gray color
% in YES rectangle

DrawFormattedText(w, '(press "p")', no_xstart, press_ystart, darkgray);    
% display press p test, dark gray color in NO rectangle

%FLIP    
Screen('Flip', w);
% flips to show text 

keyIsDown = 0; %initialize

end
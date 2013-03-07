hall_of_fame_toneprints
=======================

Code to retrieve TC Electronic toneprint files for the "Hall of Fame" reverb
pedal.

Because I'm on a Mac, only dmg (disk image) files are retrieved. A minor tweak
will allow the code to retrieve files for Windows I 'spose.

Toneprint files are stored in the "tone_prints" folder, using the artist's
name. For instance, this URL's filename will be split on /[_-]/:

    http://www.tcelectronic.com/media/323803/halloffame_stevemorse_beautifulreverb.dmg

Which results in an artist name of "stevemorse" and an image file of
"beautifulreverb.dmg", which will be stored in the "tone_prints/stevemorse"
directory as "beautifulreverb.dmg".

A file called "Toneprint_notes.txt" will also be created containing
tab-delimited rows consisting of text from several places in the download
pages. Using
http://www.tcelectronic.com/hall-of-fame-steve-morse-beautiful-reverb/ as a
reference, these text blocks will be grabbed:

    Beautiful Reverb TonePrint by Steve Morse

    Steve dialed in this TonePrint paticularly for big clean sounds. On these
    sounds the Reverb is an integrated part of the sound, full and lush.



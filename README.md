Dictation
=============

When learning a foreign language, maybe you need assistance from a "native speeker" (with almost perfect pronunciation) to dictate the new words you've learnt, and also to help you check if it's right or wrong right after one session.

This gem does all you need.

**Precondition**: Mac OSX (with built-in Text-to-Speech function).

##Usage:
```ruby
dictation new [options]
    -d, --dictate TTS                Specify two-letters language code for dictation
    -v, --verify TTS                 Specify two-letters language code for verification

dictation add [options]
    -l, --language LANGUAGE          Specify the target language file for adding more words

dictation dictate [options]
    -l, --language LANGUAGE          Specify the language for dictation
    -b, --begin WORD                 Begin with given word
    -e, --end WORD                   End with given word
    -s, --start LINE                 Start with given line
    -f, --finish LINE                Finish with given line

dictation verify [options]
    -l, --language LANGUAGE          Specify the language for dictation
    -b, --begin WORD                 Begin with given word
    -e, --end WORD                   End with given word
    -s, --start LINE                 Start with given line
    -f, --finish LINE                Finish with given line
```

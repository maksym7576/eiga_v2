

class SubtitleProcessingConfigDto {
    bool isSupported = false;
    bool removeAllSpaces = false;
    bool tokenizeWithAi = false;

    List<String> readingOptions = [];
    List<String> readingLabels = [];
    List<String> spacingOptions = [];
}
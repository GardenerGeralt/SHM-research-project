function fig = CombinedPlot(T, X, varargin)
% plots signal, spectrogram and scalogram in one figure
    Fs = 1;

    show_fig = false;
    if not(isempty(varargin))
        show_fig = varargin{1};
    end

    fig = figure('Visible', 'off');
        subplot(2,2,[1,2]), plot(T, X), axis tight
        title('Amplitude signal'), xlabel('Time (s)'), ylabel('Amplitude (V)')
        subplot(2,2,3), stft(X, Fs, 'FrequencyRange', 'onesided'), axis tight
        title('Spectrogram'), xlabel('Time window'), ylabel('Frequency (Hz)')
        [cfs,frq] = cwt(X, Fs);
        tms = (0:numel(X)-1)/Fs;
        subplot(2,2,4), surface(tms,frq,abs(cfs)), axis tight, shading flat
        title('Scalogram'), xlabel("Time (s)"), ylabel("Frequency (Hz)")
        set(gca,"yscale","log");

    if show_fig
        set(fig, 'visible', 'on'); 
    end

end
{
  services.llama-cpp = {
    enable = true;
    settings = {
      model = "/media/models/Qwen3_14B.gguf";

      host = "0.0.0.0";
      port = 1337;

      jinja = true;
      # colors = true;

      n-gpu-layers = 99;
      flash-attn = "on";
      split-mode = "row";

      temp = 0.6;
      top-k = 20;
      top-p = 0.95;
      min-p = 0;
      presence-penalty = 1.5;

      ctx-size = 40960;
      n-predict = 32768;

      no-context-shift = true;
    };
  };
}

import "@rainbow-me/rainbowkit/styles.css";
import {
  connectorsForWallets,
  getDefaultWallets,
  RainbowKitProvider,
} from "@rainbow-me/rainbowkit";
import { ChakraProvider, extendTheme } from "@chakra-ui/react";
import { configureChains, createClient, goerli, WagmiConfig } from "wagmi";
import { mainnet, polygon, optimism, arbitrum } from "wagmi/chains";
import { alchemyProvider } from "wagmi/providers/alchemy";
import { publicProvider } from "wagmi/providers/public";
import "@/styles/globals.css";
import type { AppProps } from "next/app";

export default function App({ Component, pageProps }: AppProps) {
  const theme = extendTheme({
    styles: {
      global: () => ({
        body: {
          bg: "",
        },
      }),
    },
  });
  const { chains, provider } = configureChains(
    [goerli],
    [
      alchemyProvider({ apiKey: process.env.ALCHEMY_ID as string }),
      publicProvider(),
    ]
  );

  const projectId = "YOUR_PROJECT_ID";

  const { wallets } = getDefaultWallets({
    appName: "My RainbowKit App",
    projectId,
    chains,
  });

  const connectors = connectorsForWallets([...wallets]);

  const wagmiClient = createClient({
    autoConnect: true,
    connectors,
    provider,
  });

  return (
    <WagmiConfig client={wagmiClient}>
      <RainbowKitProvider chains={chains}>
        <ChakraProvider theme={theme}>
          <Component {...pageProps} />
        </ChakraProvider>
      </RainbowKitProvider>
    </WagmiConfig>
  );
}

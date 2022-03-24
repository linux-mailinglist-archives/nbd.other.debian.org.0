Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 198B34E67E8
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 18:36:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F35AA2036D; Thu, 24 Mar 2022 17:36:50 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 17:36:50 2022
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5014C20357
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 17:36:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.19 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6NQjksdO5y5V for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 17:36:38 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A2D862032C
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 17:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vL2KCCO+kGfP5m2zx6p0QK54JU2+yC5yOpNhBtTuLy0=; b=Dtx7jdsO257X4dokOqff4LHMCJ
	nvb2vm+HN8lzM+nEmKJzI/NNkLix0XKWmRPCnejDqBESoQFdn2nXj0eb1O8SAB8qlZkiFoGIqcaUP
	uBEhDrF3urO+peb12oeAS5khib5eQ6D3Y19ey3J0EVwcTi5GCM5QlcJyiW4EbxukdjZf524QoWySf
	s2MWNbTWEQFhp1wkhLip6Z1BMCkwb8BfHtXO+1QMxw+KXUkhWe/8OfUeBwHuv6UXFgeO1aTr2y/iK
	nzw0dJfQpPUVAB6IvwCIWJmwMCXrVSd04xv+RDl08tm6qoaeqXB8Evrwfs/pBTrWxyn0WWLiud0HL
	IZwmICzg==;
Received: from [197.245.197.46] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1nXRNz-009csN-AW; Thu, 24 Mar 2022 18:36:35 +0100
Received: from wouter by pc181009 with local (Exim 4.95)
	(envelope-from <w@uter.be>)
	id 1nXRNs-0002hV-EZ;
	Thu, 24 Mar 2022 19:36:28 +0200
Date: Thu, 24 Mar 2022 19:36:28 +0200
From: Wouter Verhelst <w@uter.be>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: nbd@other.debian.org, Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: Re: [PATCH 2/3] nbd-trdump, nbd-trplay: printf
 improvements/corrections
Message-ID: <YjysHBc/slP7b34M@pc181009.grep.be>
References: <20220319121227.39165-1-manfred@colorfullife.com>
 <20220319121227.39165-3-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220319121227.39165-3-manfred@colorfullife.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nZu-8aCBWvO.A.yUH.ywKPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1777
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YjysHBc/slP7b34M@pc181009.grep.be
Resent-Date: Thu, 24 Mar 2022 17:36:50 +0000 (UTC)

On Sat, Mar 19, 2022 at 01:12:26PM +0100, Manfred Spraul wrote:
> From: Manfred Spraul <manfred.spraul@de.bosch.com>
> 
> Two improvements to the printf output:
> - Correct an incorrect printout from nbd-trplay:
>   When open() on the the log file fails, the tool incorrectly warns
>   that the disk image is inaccessible.
> 
> - Both nbd-trdump and nbd-trplay: Add a warning if unknown options
>   are encountered.
> 
> Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
> ---
>  nbd-trdump.c | 4 ++++
>  nbd-trplay.c | 4 +++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/nbd-trdump.c b/nbd-trdump.c
> index d914e63..c7c5322 100644
> --- a/nbd-trdump.c
> +++ b/nbd-trdump.c
> @@ -130,14 +130,18 @@ int main(int argc, char**argv) {
>  					break;
>  				default:
>  					printf("TRACE_OPTION ? Unknown type\n");
> +					printf(" Further log file evaluation may be incorrect, please upgrade nbd-trdump.\n");
> +
>  				}
>  			} else {
>  				printf("TRACE_OPTION ? Unknown FROM_MAGIC\n");
> +				printf(" Further log file evaluation may be incorrect, please upgrade nbd-trdump.\n");
>  			}
>  			break;
>  
>  		default:
>  			printf("? Unknown transaction type %08x\n",magic);
> +			printf(" Further log file evaluation may be incorrect, please upgrade nbd-trdump.\n");
>  			break;
>  		}
>  		
> diff --git a/nbd-trplay.c b/nbd-trplay.c
> index 143d8cb..f98b7df 100644
> --- a/nbd-trplay.c
> +++ b/nbd-trplay.c
> @@ -221,9 +221,11 @@ int main_loop(int logfd, int imagefd) {
>  					break;
>  				default:
>  					printf("TRACE_OPTION ? Unknown type\n");
> +					printf(" Further log file evaluation may be incorrect, please upgrade nbd-trplay.\n");
>  				}
>  			} else {
>  				printf("TRACE_OPTION ? Unknown FROM_MAGIC\n");
> +				printf(" Further log file evaluation may be incorrect, please upgrade nbd-trplay.\n");
>  			}
>  			break;
>  
> @@ -301,7 +303,7 @@ int main(int argc, char **argv) {
>  		case 'l':
>  			logfd = open(optarg, O_RDONLY, 0);
>  			if (logfd == -1) {
> -				printf("  Opening disk image failed, errno %d.", errno);
> +				printf("  Opening log file failed, errno %d.", errno);

Please use perror() for these instead.

>  				return 1;
>  			}
>  			break;
> -- 
> 2.35.1
> 
> 

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}


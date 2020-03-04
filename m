Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B33179890
	for <lists+nbd@lfdr.de>; Wed,  4 Mar 2020 20:06:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CE53A201B8; Wed,  4 Mar 2020 19:06:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar  4 19:06:08 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 717F620194
	for <lists-other-nbd@bendel.debian.org>; Wed,  4 Mar 2020 18:48:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zOanBd4YI0my for <lists-other-nbd@bendel.debian.org>;
	Wed,  4 Mar 2020 18:48:32 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x742.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1D3932015A
	for <nbd@other.debian.org>; Wed,  4 Mar 2020 18:48:31 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id u124so2679152qkh.13
        for <nbd@other.debian.org>; Wed, 04 Mar 2020 10:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cwAu9ms1QlnsyjqjRoDdlFh/CoyENRzdXwbEfO2QfE8=;
        b=ghsQIPoKYt5kavTIwPK3kv7RSD3Ayc3Vq13Nd8fuufcYVmwNukXiA4Vl+Qrxlz2JoS
         UoyU3PnqbqKY47c7cEIzeXVY7EhXTi1VVkXhuFTpidkPzk4WCwBKlN9rJvtcp6E41lDD
         Cars9e+Av8jL04fQgth3tHvfnQGHeURhp8JtwfM6l49pIY/hzfYWFpbOIPBHR8AtOcci
         XdTNQ5Tg7/fJRhonxob1XfwoSk4GGm2+ztEyUeRHvzMIY4UH8RMjNYEv9cwY5m7M2VaS
         gEkls0z2eHFseavMSgxK0NpY3mwxIw/RrMu5PB0OvSZiPA3jhEW5rYkkymcHNyEgGoy5
         qtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cwAu9ms1QlnsyjqjRoDdlFh/CoyENRzdXwbEfO2QfE8=;
        b=qU/Fhu1LJ1NzJE68N66cP3UFXN1aiL1wl3cLW51U4szZsRNHNjFX6XBOyuVvAonU8g
         kKDNXExUG+tsQe60JzqWTUqtP4EXir3Y5P/Bjkd7HfdgFIsHqLg7pR+roLE1kiZy+GHM
         8FD+YgUPjjSlGyjUZxw4Ql4itY7dRCJVKGUadjOHtEptoAo1us7l1UxZciXWUPXWx9yw
         TLPj31GnCZkeJx1iMM5KrGOrvHsr261buCgnHnlnkTHT22+GI9pKHcRNoN+8p8pN+3li
         3F3ZFmV/bu6dYhMdgMoVVbNSaD69GlzF0CA7Z+y8Ek3rbSQnC77ae7bBBCZPwj1A92HH
         zytA==
X-Gm-Message-State: ANhLgQ2HEEr08VDQ7FydM05FLHZ0YLJpmouyTPLjKCwnIoccOru95JwC
	9F0HS+UXh+TrPik38Rpe6GpH7Q==
X-Google-Smtp-Source: ADFU+vtOy/WgHyHX5ovPEB0ebccX19/lh6rFyqX7Z/FfXl9F0FyHVRH2k1rZFkRhTbg/JTXsFaE3Ig==
X-Received: by 2002:a05:620a:13a9:: with SMTP id m9mr4414360qki.359.1583347707934;
        Wed, 04 Mar 2020 10:48:27 -0800 (PST)
Received: from [192.168.1.106] ([107.15.81.208])
        by smtp.gmail.com with ESMTPSA id i1sm9122768qtg.31.2020.03.04.10.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 10:48:27 -0800 (PST)
Subject: Re: [PATCH 1/2] nbd: enable replace socket if only one connection is
 configured
To: Hou Pu <houpu.main@gmail.com>, axboe@kernel.dk, mchristi@redhat.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 Hou Pu <houpu@bytedance.com>
References: <20200228064030.16780-1-houpu@bytedance.com>
 <20200228064030.16780-2-houpu@bytedance.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <fcfdb11d-3af0-0807-b06c-8ca69723a47b@toxicpanda.com>
Date: Wed, 4 Mar 2020 13:48:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228064030.16780-2-houpu@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6LHGH50tixI.A.YR.gw_XeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/849
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/fcfdb11d-3af0-0807-b06c-8ca69723a47b@toxicpanda.com
Resent-Date: Wed,  4 Mar 2020 19:06:08 +0000 (UTC)

On 2/28/20 1:40 AM, Hou Pu wrote:
> Nbd server with multiple connections could be upgraded since
> 560bc4b (nbd: handle dead connections). But if only one conncection
> is configured, after we take down nbd server, all inflight IO
> would finally timeout and return error. We could requeue them
> like what we do with multiple connections and wait for new socket
> in submit path.
> 
> Signed-off-by: Hou Pu <houpu@bytedance.com>

Alright turns out I'm an idiot, you can add

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef


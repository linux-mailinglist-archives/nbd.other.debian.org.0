Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D02934F98
	for <lists+nbd@lfdr.de>; Thu, 18 Jul 2024 17:03:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 68A7620FA9; Thu, 18 Jul 2024 15:03:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul 18 15:03:10 2024
Old-Return-Path: <bvanassche@acm.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_LOW autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 78B3E20FA0
	for <lists-other-nbd@bendel.debian.org>; Thu, 18 Jul 2024 14:45:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.8 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_LOW=-0.7] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 24ovJk3dVeyr for <lists-other-nbd@bendel.debian.org>;
	Thu, 18 Jul 2024 14:45:09 +0000 (UTC)
X-policyd-weight: using cached result; rate: -6.6
X-Greylist: delayed 589 seconds by postgrey-1.36 at bendel; Thu, 18 Jul 2024 14:45:09 UTC
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailroute.net", Issuer "R11" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 544CC20F67
	for <nbd@other.debian.org>; Thu, 18 Jul 2024 14:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4WPwM825jyz6CmLxd;
	Thu, 18 Jul 2024 14:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1721313314; x=1723905315; bh=r6WUwL/AfTAg9k1QGtJY47h5
	tBIVOkzCh9ntIdhu1rE=; b=bHuqSYe5G72TAkCmGwlNsDahkRrCnIgnWin59G5Q
	kG6VaIsXTuMEquYI8AXHzjc38rtgaFYxmWx4VKcbojWzpIw3B4Jf6gn+vXnp0vCb
	LZBRqkkfW+60/KyHyg/+dET4FxLD123IQ6GjzL5CyTqUwkKgeiWZ1yBn2STbY6ct
	zc8FImVQ0SmLQp0VHs5aFm4WcfgOk+HEPo0D3ByGz5fID+pr6LZDFWumGtagK9Ca
	4ca+bECAy9jDUXXnnaKxspEhQHduOD2Fr/asCyGrMuIg4UW7JBIKfQ58cYXCYX0x
	iSUPOPQp5hFtXlajZJ2NP7pAbA6fgdgK2Amq71kQdcC5HQ==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id SdmrPCUDONgQ; Thu, 18 Jul 2024 14:35:14 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4WPwM62lPWz6CmLxY;
	Thu, 18 Jul 2024 14:35:14 +0000 (UTC)
Message-ID: <72c1c93e-4ee0-4830-8950-ecfd72c0e102@acm.org>
Date: Thu, 18 Jul 2024 07:35:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH blktests] nbd/rc: check nbd-server port readiness in
 _start_nbd_server()
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 linux-block@vger.kernel.org, nbd@other.debian.org
Cc: Yi Zhang <yi.zhang@redhat.com>
References: <20240718111207.257567-1-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240718111207.257567-1-shinichiro.kawasaki@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <wMPplaLyqnI.A.MQ8G.u6SmmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3096
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/72c1c93e-4ee0-4830-8950-ecfd72c0e102@acm.org
Resent-Date: Thu, 18 Jul 2024 15:03:10 +0000 (UTC)

On 7/18/24 4:12 AM, Shin'ichiro Kawasaki wrote:
> +	# Wait for nbd-server start listening the port
> +	for ((i = 0; i < 10; i++)); do
> +		if nbd-client -l localhost &> "$FULL"; then
> +			break
> +		fi
> +		sleep 1
> +	done

Has it been considered to reduce the delay from one second to e.g. a
tenth of a second and to increase the number of iterations? I do not
expect it to take one second for nbd-server to start.

Thanks,

Bart.


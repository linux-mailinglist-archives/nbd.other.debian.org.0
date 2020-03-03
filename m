Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C061784FB
	for <lists+nbd@lfdr.de>; Tue,  3 Mar 2020 22:36:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0AA182016A; Tue,  3 Mar 2020 21:36:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar  3 21:36:40 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7380B2013B
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Mar 2020 21:20:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jNWeKtbR88dO for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Mar 2020 21:20:29 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x843.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id CD0B420140
	for <nbd@other.debian.org>; Tue,  3 Mar 2020 21:20:29 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id o10so4040684qtr.7
        for <nbd@other.debian.org>; Tue, 03 Mar 2020 13:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7+rNtwc3taKkaB/BWsH2V4WaM282d/1lxQTUPD2UwBw=;
        b=Vaq2dpQ6rRdONuhCdFMMR0HIfubWJbWCLbfZAgsNTqg4O4a09poVhXrEDLD6zjcY2d
         JHE5rF3BUUX8kanVAjUnZstP8kVKl6NOyub5rx/sigjkTvtzMZwQju5RSqiIHr0xTglJ
         2XdntdihhYKdZ8mMsB8XpF2WWHqXYDkc9kmL/5LwtYFuGHNBHrvJOdhIRBvOk4AbYhJH
         FLGlhYiCG/JIkt5HTj6gUBPdQ1wAHEYLr38JyZX0UdaSWZP8FWIZUOoqww8aM4n63EnC
         OhS2fedbCHLv9tvXQ61E2DpZ6hWMeeMSQy+NjbNGLGxG0J1+qbz86OIFXIULffqy2fH0
         wF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7+rNtwc3taKkaB/BWsH2V4WaM282d/1lxQTUPD2UwBw=;
        b=uluzwx3tjLrX1xUd7LoizDGZIImj7oIxrMHJrRZ6fCFmyeCkucbeCvNE2bsTrum4+f
         TseI5btbkzyODZ0X9teNRK3eVXKR1YWSkEKoujbGRdHnVbDZ7pHVP+BtmFY5BNrvwgbs
         BKa/bIBhLHeds1rQ72BatmBGpP2VzAFCepjHRPFo5Nw18VxczXrLdltrGDk1OXKhPIE0
         yKFcXZSEEALyK/9SLmXxZSVC1Px7XD36hBTpeLe2BURtHZluiBu9VIDo13wUcK50uutb
         o0YIqpJIGlfFx0PP/SlEnn54Abn3GHAdWwI3lebFOzUohjMguC/l+CdpLMUzBK4to0rm
         xtdA==
X-Gm-Message-State: ANhLgQ1dLiAc2kn9l7LDb7ZRnAw4s4LpD3RJ4d+9ogIbGhnsNMzY5/lR
	fDxvLxGZ/pUeZxUCuwePq+h27joH9HM=
X-Google-Smtp-Source: ADFU+vvlY9Ns+7ioJ4OLOFRK0oVo13JpxjmwUkzD16hudS4jYTmPzIRaQp3gLzV3hcGOiM36kwE9PA==
X-Received: by 2002:ae9:e104:: with SMTP id g4mr5777015qkm.133.1583269930094;
        Tue, 03 Mar 2020 13:12:10 -0800 (PST)
Received: from [192.168.1.106] ([107.15.81.208])
        by smtp.gmail.com with ESMTPSA id c13sm7034032qtv.37.2020.03.03.13.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2020 13:12:09 -0800 (PST)
Subject: Re: [PATCH 1/2] nbd: enable replace socket if only one connection is
 configured
To: Hou Pu <houpu.main@gmail.com>, axboe@kernel.dk, mchristi@redhat.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 Hou Pu <houpu@bytedance.com>
References: <20200228064030.16780-1-houpu@bytedance.com>
 <20200228064030.16780-2-houpu@bytedance.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <3b6ae210-f942-b74d-1e53-768c7e8c3675@toxicpanda.com>
Date: Tue, 3 Mar 2020 16:12:08 -0500
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
Resent-Message-ID: <RDGWb8X_DbD.A.64B.o3sXeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/842
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/3b6ae210-f942-b74d-1e53-768c7e8c3675@toxicpanda.com
Resent-Date: Tue,  3 Mar 2020 21:36:41 +0000 (UTC)

On 2/28/20 1:40 AM, Hou Pu wrote:
> Nbd server with multiple connections could be upgraded since
> 560bc4b (nbd: handle dead connections). But if only one conncection
> is configured, after we take down nbd server, all inflight IO
> would finally timeout and return error. We could requeue them
> like what we do with multiple connections and wait for new socket
> in submit path.
> 
> Signed-off-by: Hou Pu <houpu@bytedance.com>
> ---
>   drivers/block/nbd.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 78181908f0df..83070714888b 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -395,16 +395,19 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
>   	}
>   	config = nbd->config;
>   
> -	if (config->num_connections > 1) {
> +	if (config->num_connections > 1 ||
> +	    (config->num_connections == 1 && nbd->tag_set.timeout)) {

This is every connection, do you mean to couple this with dead_conn_timeout? 
Thanks,

Josef


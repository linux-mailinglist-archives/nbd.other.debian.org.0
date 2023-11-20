Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3AD7F19C4
	for <lists+nbd@lfdr.de>; Mon, 20 Nov 2023 18:24:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EB4BB2069E; Mon, 20 Nov 2023 17:24:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 20 17:24:15 2023
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 33AF62056C
	for <lists-other-nbd@bendel.debian.org>; Mon, 20 Nov 2023 17:08:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.01 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Ml41n1GobL-A for <lists-other-nbd@bendel.debian.org>;
	Mon, 20 Nov 2023 17:08:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-ot1-x329.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9A3072056E
	for <nbd@other.debian.org>; Mon, 20 Nov 2023 17:08:06 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6cd1918afb2so3110197a34.0
        for <nbd@other.debian.org>; Mon, 20 Nov 2023 09:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1700500083; x=1701104883; darn=other.debian.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YONG+Z2URy3adHFF9a9PVlDLMWSCL7QCJLkVV8u42Pw=;
        b=QhOmvZV7dr8n6IM+qR25wX/iG6n8rI9Q3dgu1ArJUBnebF21dX9KWlnNAKyahXrbGm
         zBudQW2/ZV/wb0Gi+JbJNr4Phxx0zsYWRsy3YOFH5W7iY2rT0AaOwzwdDD5MdU8za0Bl
         f9VEAyIXrTBW7UJINvl8Z1vvR4Zf+30qfscn5bOLdK6E8iO9XLwiACbUoOuV4Ww9XfTF
         OmqJAT9QSW+cIjmoIHQAzEl3ZRNijYdooIrRK8m6wS5cfz10n9R207lELQwIzU6jD1XT
         uoIIKVkQmzLcShooOvn38dl8NnnKeZLrjwbbjifJupar+G0XA3dWgSEjMgPefpot335Y
         RJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700500083; x=1701104883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YONG+Z2URy3adHFF9a9PVlDLMWSCL7QCJLkVV8u42Pw=;
        b=KrHjpJxuqH/83ns3tWyYqNTQE3JoHUTWw56iRESbOZW0uY7qdXrpPpuyeCfD2oIktp
         DzIsXC/dupCDjqDYQRW1Cv9wP5D33nZodAoCGz/g8RKIT1d7kXX5+gLMW+u++RGSC8Sp
         ucHDs6STJQD3MdNaAu86aRuM+ZqQ/w6sWf74HgmlezqH54Cdmk/uo+z7mxR0MtrENzYT
         uDFy9q+vZvaEcElEtDtk//TLAE9qwz2baM9A/aukfmyy+rXUNvWhxXujD8ZXAAID77rt
         BHvzV8jwdQC8vSi9f3GUS3plNeXw4w1rm/tkOltoSnPM35hRiCuFsQvxH23NZYRn+jWh
         HB+g==
X-Gm-Message-State: AOJu0YwbzlFFv59V0Wb2+r8Kc4C9i3x3Ae3E76RdZVP/qPyQUBqn0cTj
	sD6WqAUkotjC3SlJOcAenbXU3A==
X-Google-Smtp-Source: AGHT+IFntqoennN4i02M6FokmS927XOCsf17rxNKxMCqvhCEf4Qanz23np6ZpH0J6iyKKVqOgDZ1Vw==
X-Received: by 2002:a9d:7f9a:0:b0:6cd:4fc8:3efc with SMTP id t26-20020a9d7f9a000000b006cd4fc83efcmr2991186otp.19.1700500083719;
        Mon, 20 Nov 2023 09:08:03 -0800 (PST)
Received: from localhost (cpe-76-182-20-124.nc.res.rr.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id o10-20020a817e0a000000b005c98f9d2444sm1389692ywn.3.2023.11.20.09.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 09:08:03 -0800 (PST)
Date: Mon, 20 Nov 2023 12:08:02 -0500
From: Josef Bacik <josef@toxicpanda.com>
To: linan666@huaweicloud.com
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org, linan122@huawei.com,
	yukuai3@huawei.com, yi.zhang@huawei.com, houtao1@huawei.com,
	yangerkun@huawei.com
Subject: Re: [PATCH 0/3] fix null-ptr-deref in nbd_open()
Message-ID: <20231120170802.GD1606827@perftesting>
References: <20231116162316.1740402-1-linan666@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116162316.1740402-1-linan666@huaweicloud.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vw9xpGppQuM.A.jzG._Y5WlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2675
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20231120170802.GD1606827@perftesting
Resent-Date: Mon, 20 Nov 2023 17:24:15 +0000 (UTC)

On Fri, Nov 17, 2023 at 12:23:13AM +0800, linan666@huaweicloud.com wrote:
> From: Li Nan <linan122@huawei.com>
> 
> Li Nan (3):
>   nbd: fold nbd config initialization into nbd_alloc_config()
>   nbd: factor out a helper to get nbd_config without holding
>     'config_lock'
>   nbd: fix null-ptr-dereference while accessing 'nbd->config'
> 
>  drivers/block/nbd.c | 82 +++++++++++++++++++++++++++++----------------
>  1 file changed, 53 insertions(+), 29 deletions(-)
> 
> -- 
> 2.39.2
> 

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef


Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D26D2AAA28
	for <lists+nbd@lfdr.de>; Sun,  8 Nov 2020 10:03:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 235D620192; Sun,  8 Nov 2020 09:03:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Nov  8 09:03:13 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BB7572018F
	for <lists-other-nbd@bendel.debian.org>; Sun,  8 Nov 2020 08:47:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.981 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VMGV_nuq6TYX for <lists-other-nbd@bendel.debian.org>;
	Sun,  8 Nov 2020 08:47:21 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pl1-x644.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9892C2018C
	for <nbd@other.debian.org>; Sun,  8 Nov 2020 08:47:17 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id t22so3062885plr.9
        for <nbd@other.debian.org>; Sun, 08 Nov 2020 00:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/Nt8PyG6XTzRj0oeg+Tq6GJQjN/jJVl2VwJ8IDyOvio=;
        b=W67otHr1Qgxg4hXBKhc7+ztKmaSqm6uKNZ/+8gtNzSPPsV2yYlFa63NUTqkqxg6WVZ
         97TIxSxjsSKjXhFRWnVfhkaML6ksuUGnLAmomQxRIFraQgWGib/iCuXVCn3PRkcV6p9u
         +AumSbpl26niIs9GGmlLUd4/ZyZcxj+hzoiy5TSxHPj1BrqbayC6IgRHSr5I8H0Qo0+b
         Nzqa1EV/8lm3onHz+JNlejZrsCwncId3H6EMmcxWMQxyxELVK/lENLP7nsvqTdTJziIP
         TQMiDssfdBHBFnNQceZ5zCbSZ8kxoeHED0kyZC4K+XYapRNhMdcq/1wkpSgxlovSEgxa
         Jr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/Nt8PyG6XTzRj0oeg+Tq6GJQjN/jJVl2VwJ8IDyOvio=;
        b=M9NXxqf88WpAz0SMQlS0VsOD2x6TLrOGFMsnoN6Hf+eatue7R4S9lwP4ZFxWcSuBGK
         jvOWCgM167C9nFNsCjpWWNocwJnpCTZ9HzRHvcrA+0Z7MAzq+NWz+/iZ1AFN4g3d7D9/
         NqbZlAkGqe8Gk11nNZ7ZP0lsyWzP1KV+E/TkT/0/q5rMQsfUeNvwIUdXbMKOtpyZdrdS
         lFPOgaAi56SnlhNtuDeyuJMpFxcisy2yUdfFrBxCIkBcT2NYKnfraY5QEmI3Ea4ZVCcd
         GMth1Rojhme4uqMkThZQ1asJqrdkuGow+eHPLzil5LZuZPw++9ChHykCQWcYY7Tk8xuy
         bvog==
X-Gm-Message-State: AOAM530jeO/uEoA/qdX+sTsE/X4sch9px8hlrVIoFPnuNt0I0GQIkDoR
	4SGBUQ7PnSZ7/3r1MARrSPhwxQ7SlA6A8ZFj
X-Google-Smtp-Source: ABdhPJwbAl3DdZhSyIwBG8RUNdjCerhPVKKKD9oAALXRcKYb7S4HxP6T66Fh9TjKA9uY2or6AUT0Ag==
X-Received: by 2002:a17:902:bd05:b029:d6:f041:f5b with SMTP id p5-20020a170902bd05b02900d6f0410f5bmr8447671pls.9.1604825233633;
        Sun, 08 Nov 2020 00:47:13 -0800 (PST)
Received: from houpudeMacBook-Pro.local ([240e:b1:e401:4::9])
        by smtp.gmail.com with ESMTPSA id x123sm7641844pfb.212.2020.11.08.00.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2020 00:47:13 -0800 (PST)
Subject: Re: [PATCH v3 0/2] nbd: improve timeout handling and a fix
To: axboe@kernel.dk
Cc: josef@toxicpanda.com, linux-block@vger.kernel.org, nbd@other.debian.org
References: <20200930032350.3936-1-houpu@bytedance.com>
From: Hou Pu <houpu@bytedance.com>
Message-ID: <e0f31dec-fa4b-11d5-a784-9e661e2c054f@bytedance.com>
Date: Sun, 8 Nov 2020 16:46:50 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20200930032350.3936-1-houpu@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WegLd_JbDPO.A.I8C.RR7pfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1040
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e0f31dec-fa4b-11d5-a784-9e661e2c054f@bytedance.com
Resent-Date: Sun,  8 Nov 2020 09:03:13 +0000 (UTC)



On 2020/9/30 11:23 AM, Hou Pu wrote:
> Patch #1 is a fix. Patch #2 is trying to improve io timeout
> handling.
> 
> Thanks,
> Hou
> 
> v3 changes:
> * Add 'Reviewed-by: Josef Bacik <josef@toxicpanda.com>' in patch #2.

Hi Jens,
Sorry to bother. Emmm, It would be great to pick up these 2 patches
into the upstream. Could you give a helping hand?

Thanks,
Hou

> 
> v2 changes:
> * Add 'Reviewed-by: Josef Bacik <josef@toxicpanda.com>' in patch #1.
> * Original patch #2 is dropped.
> * Keep the behavior same as before when we don't set a .timeout
> and num_connections > 1.
> * Coding style fixes.
> 
> Hou Pu (2):
>    nbd: return -ETIMEDOUT when NBD_DO_IT ioctl returns
>    nbd: introduce a client flag to do zero timeout handling
> 
>   drivers/block/nbd.c      | 33 ++++++++++++++++++++++++++++-----
>   include/uapi/linux/nbd.h |  4 ++++
>   2 files changed, 32 insertions(+), 5 deletions(-)
> 


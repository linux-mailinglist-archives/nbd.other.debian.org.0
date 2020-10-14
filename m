Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A93328E6A5
	for <lists+nbd@lfdr.de>; Wed, 14 Oct 2020 20:48:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3477220B19; Wed, 14 Oct 2020 18:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 14 18:48:09 2020
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BE97F20B0D
	for <lists-other-nbd@bendel.debian.org>; Wed, 14 Oct 2020 18:31:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.193 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.213,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7gSMxWHmR7BT for <lists-other-nbd@bendel.debian.org>;
	Wed, 14 Oct 2020 18:31:03 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-il1-x141.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B5FA520B10
	for <nbd@other.debian.org>; Wed, 14 Oct 2020 18:31:03 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id t12so412532ilh.3
        for <nbd@other.debian.org>; Wed, 14 Oct 2020 11:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FEIa6TZi1gl8k/Kuzi1wRaNTSDsRO+ZiNXMqLrHUkiE=;
        b=A69RiEBRUcH+o8TCpYXBCPEaIqdxjeNUfUhJENQNfZCdBa5zz5i3ndOMOaowI3blkw
         jnj3c4UW/Lr31jhQkqPWfnICQpEFynzenq1K/vQ723++EY2jnhkWkHFaIWFhh0oPfdOe
         Zl78HStCIfz14P8UUEwCjeepPAUzo1uD2jRo3nPM7lW7I2etCQJ7fsEgYnkLtgiTHdoS
         YZ+WEE4UBrPNZ4MHhT5r+Gajg8FJ0I/iZF8c1m9oosXztk/yoTOZm2tsOd7Rg3Cybno4
         W9MnyprX3BJUHbGka0hlKT4AniVRySjlpCyZfOb9KVZ7vevF9TlXgkV+jT3QY0txDzOe
         S+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FEIa6TZi1gl8k/Kuzi1wRaNTSDsRO+ZiNXMqLrHUkiE=;
        b=guwTXt317/JtWmjv2SzcpDqx5FBwHPOW90FLYAtSzlhuT3hd8H4yCopsU7ryoMnePV
         UfhCxgJr5qlCqS+I39wUCo49pAfQyKMQIOTPtpD10eGloq1jllq5taEaJqhXTRUGb5Bv
         nkwf391XfSzBG8edF9HRmyqQ6Ux/WIUC+J2lVub1EVCujzeXXsvHclhiSoV6ewtCfqiV
         sg2ggaU5E0n6FD8wovOfhPCaqmP/U45x3wu9spzhSTSTJLdidpjV9LFRWgfo2BIX8aBJ
         K5aRUfixlIBZBlkG73SDCGM7wL8xU96zpzDrCL7y83Lqqh8Oa04F5y3Ddi1UJH2fDhVI
         /DhQ==
X-Gm-Message-State: AOAM532ovEoGTZQN15T6fynueG41mg956lAwKGpeoCrCJW4VHRHy+nH9
	MFyBZwujBtPTMPAkX0OnprzwBJHIiixt9Q==
X-Google-Smtp-Source: ABdhPJwgMJGWkAAkyeWGAKdaXALLHhUroa5yCDNLtnJC/Ehdw7d6Ckz9M1Ty7Nl2L+Y1Ic3fPbcm3Q==
X-Received: by 2002:a92:9183:: with SMTP id e3mr408282ill.111.1602700259884;
        Wed, 14 Oct 2020 11:30:59 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id b9sm136777ilq.51.2020.10.14.11.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 11:30:59 -0700 (PDT)
Subject: Re: [PATCH] nbd: make the config put is called before the notifying
 the waiter
To: xiubli@redhat.com, josef@toxicpanda.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org
References: <20201014024514.112822-1-xiubli@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <180ba921-5fb0-e360-47c9-4b26433bf5fa@kernel.dk>
Date: Wed, 14 Oct 2020 12:30:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201014024514.112822-1-xiubli@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DiHk4FYZ8mG.A.XTD.pf0hfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1016
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/180ba921-5fb0-e360-47c9-4b26433bf5fa@kernel.dk
Resent-Date: Wed, 14 Oct 2020 18:48:09 +0000 (UTC)

On 10/13/20 8:45 PM, xiubli@redhat.com wrote:
> From: Xiubo Li <xiubli@redhat.com>
> 
> There has one race case for ceph's rbd-nbd tool. When do mapping
> it may fail with EBUSY from ioctl(nbd, NBD_DO_IT), but actually
> the nbd device has already unmaped.
> 
> It dues to if just after the wake_up(), the recv_work() is scheduled
> out and defers calling the nbd_config_put(), though the map process
> has exited the "nbd->recv_task" is not cleared.

Applied, thanks.

-- 
Jens Axboe


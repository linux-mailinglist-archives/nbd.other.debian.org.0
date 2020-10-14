Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D6928E5BB
	for <lists+nbd@lfdr.de>; Wed, 14 Oct 2020 19:51:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C390A20AEF; Wed, 14 Oct 2020 17:51:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 14 17:51:08 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 41A6020ACD
	for <lists-other-nbd@bendel.debian.org>; Wed, 14 Oct 2020 17:33:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.193 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.213,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 82K12LbZDQsU for <lists-other-nbd@bendel.debian.org>;
	Wed, 14 Oct 2020 17:33:15 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-il1-x141.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B0B5620ADA
	for <nbd@other.debian.org>; Wed, 14 Oct 2020 17:33:15 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id p9so180920ilr.1
        for <nbd@other.debian.org>; Wed, 14 Oct 2020 10:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tRDSdNfW5xL0OCw3aVdBJS6qEgVKNgk2J6NDdHjZfMg=;
        b=ekuKHbJedsMbsSBm4oXfbppYsLn56Hz74NMTlNJr+xKtDh5yFePtpgQ1GFFcxHUv8N
         nwsmUKbc4LxenxdGNgx9QstVxdXZ1O1BY3Zqv3iWXR3q2TYE/9GcWroqAvNS9c0KPxVF
         WSTfHtl6TjcfKvKIidKc3j/Ra4IW/I22hwJdm+lojnXIyDMC/bNkIMVMEE/sH8Lgt+J3
         KlaGAY4qtSayId/pNzcJRJhyR/LTtsKJWDWW2z3USV7L6FjxvwXFXniusl9+Wdbg9FKW
         DF4+qQWvC+D2bnEZ/yH6W+CYnMrgAyZnAohl+UizJh7PBWZiI0YidEbjqVDwiaLKlA9n
         dsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tRDSdNfW5xL0OCw3aVdBJS6qEgVKNgk2J6NDdHjZfMg=;
        b=rOObuz4RclA/VQa59CXVvH0zjNIN5qtg40GSoGnrdVdDE22ONtvg9V1aPAiqYALGAj
         /l9VS19BcD2Gd+jrDj2PXJyTz9yI2v3Mb+dUVSMIv7qZkdNPLjRHKyoNbojMhof3pMCb
         FNy4gkMfCoT8l0KYtRfdvKhcn8erogkzMe1D76WtRaoWamfK+t3fKUrDr0UhygPVRETM
         sip8ohglKGWofmcAKHLBQKJdzY7UBnh0v3omJKjCDRJXj4Jf/GT97HrMMV34D6659bDs
         XxIdle22qJEEXVuMFNu9uoRIvGXZMp+uq0CPo+qpTY25UQIUoisMAiC0x8naiUUheHYV
         TlEA==
X-Gm-Message-State: AOAM532pvA2bG/PqSqRltMONttITwZWQZkX8nu1yUEG8QzoojmPW9oY/
	oFig4Bt0vtzOA6Z4fk2kAzs85rdM6H5vhQ==
X-Google-Smtp-Source: ABdhPJzUZ3vbf/cJ6Jcs6Wvjja4Z71dnbGwE2d9F+nzc8UuJ+lWQrsiUsOfP05LbDstKN4ZApmWJpw==
X-Received: by 2002:a92:a012:: with SMTP id e18mr157528ili.269.1602696791688;
        Wed, 14 Oct 2020 10:33:11 -0700 (PDT)
Received: from ?IPv6:2620:10d:c0a8:11d1::1116? ([2620:10d:c091:480::1:1580])
        by smtp.gmail.com with ESMTPSA id n138sm143461iod.40.2020.10.14.10.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 10:33:10 -0700 (PDT)
Subject: Re: [PATCH] nbd: make the config put is called before the notifying
 the waiter
To: xiubli@redhat.com, axboe@kernel.dk
Cc: linux-block@vger.kernel.org, nbd@other.debian.org
References: <20201014024514.112822-1-xiubli@redhat.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <454c2a43-a0cd-68f9-80ec-172d4bded068@toxicpanda.com>
Date: Wed, 14 Oct 2020 13:33:08 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201014024514.112822-1-xiubli@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kJGSNE0MfTP.A.1kD.MqzhfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1015
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/454c2a43-a0cd-68f9-80ec-172d4bded068@toxicpanda.com
Resent-Date: Wed, 14 Oct 2020 17:51:08 +0000 (UTC)

On 10/13/20 10:45 PM, xiubli@redhat.com wrote:
> From: Xiubo Li <xiubli@redhat.com>
> 
> There has one race case for ceph's rbd-nbd tool. When do mapping
> it may fail with EBUSY from ioctl(nbd, NBD_DO_IT), but actually
> the nbd device has already unmaped.
> 
> It dues to if just after the wake_up(), the recv_work() is scheduled
> out and defers calling the nbd_config_put(), though the map process
> has exited the "nbd->recv_task" is not cleared.
> 
> Signed-off-by: Xiubo Li <xiubli@redhat.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef


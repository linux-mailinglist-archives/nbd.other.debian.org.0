Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF87144692
	for <lists+nbd@lfdr.de>; Tue, 21 Jan 2020 22:42:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CF9AC203D0; Tue, 21 Jan 2020 21:42:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan 21 21:42:08 2020
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8EF8F203A0
	for <lists-other-nbd@bendel.debian.org>; Tue, 21 Jan 2020 21:25:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.96 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FVGT_m_MULTI_ODD=0.02, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LQINf9XjLvkr for <lists-other-nbd@bendel.debian.org>;
	Tue, 21 Jan 2020 21:25:25 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-il1-x142.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C349820399
	for <nbd@other.debian.org>; Tue, 21 Jan 2020 21:25:22 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id v69so3499180ili.10
        for <nbd@other.debian.org>; Tue, 21 Jan 2020 13:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FHCvw3BPgEGuM+0lfBGPIFX9bQ88tvGWWuXcX9fLsHY=;
        b=qXjTaDPwyPUafBpzuhsi1ITIYQBhCPvnUaCq5unGMHCEZID3D2E7vNgrj6YiQvb/Dl
         vW9/+EL1jdb/jKYwudEW7PEOy42rH/0t0IodwwMAFEi6g61Z+4pkFeAgoXgMG8744qJx
         Bcnmf9Nw/RgVRm44x07L8eeTfw9WBSjXU8fU2Dxq+J1G4yrto2eDUAFSPCRVLoKr26/V
         l+ioFMzci7six7lSmV3a9jjjqfg4nBXF6IY8k8yzr/POU+0w/K2xAHpaE5MEnFUse493
         zCAdGwD6tByHfhs5dJN4hytggJKVC22sHrK5U/BwKxLCQ5FLDDSjqXhqA+3kChv/v2sh
         /O+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FHCvw3BPgEGuM+0lfBGPIFX9bQ88tvGWWuXcX9fLsHY=;
        b=VxO8sKvw5fORY3gjci0In+FptQGMuXvyZTAy6M0nlRO9b85WFzOpn76j8vIO9/Ropj
         k3n39pne76DerQXTaz9HcQVxojIkPyxaaj+8vpa8wGMh6NOB2rkhKfVabDgFFnrUFtOm
         zypOC/VeAs9ETb6AItOdst8Hgs847EMK1X9HtdMJywhGbuEai5qaLyBu+LCW/LFAOJrX
         ylj9XcweASqLGxEyEAGkQAbwFvCxBMBd75AvgiYDG3sV0k3mEDHmciHn9Bwa7GWhvllG
         Ku01vBps5c34zO+nZ0QKYMRXeMQ39UXskwuUezuiGlD+s2Nb6JA9zPh/P2Cro9+DSswm
         fMnQ==
X-Gm-Message-State: APjAAAXygVFkaK27ihsHMIZkamEsGDvntzzOGeQz+Fo3ZaSZmZ6ynOrd
	BsTYoi0a6UBXhdaQV4V/7+1Y1w==
X-Google-Smtp-Source: APXvYqxPLzlyge3FdUW1OJLyyZvj9cGo8aGoZ7RSW91nft7bFum48eXlAWOVjm4i1elqSsWJy65tCg==
X-Received: by 2002:a92:9e97:: with SMTP id s23mr5712813ilk.139.1579641919076;
        Tue, 21 Jan 2020 13:25:19 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id l8sm9854822ioc.42.2020.01.21.13.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 13:25:18 -0800 (PST)
Subject: Re: [PATCH] nbd: add a flush_workqueue in nbd_start_device
To: Josef Bacik <josef@toxicpanda.com>, Sun Ke <sunke32@huawei.com>,
 mchristi@redhat.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <20200121124813.13332-1-sunke32@huawei.com>
 <82a3eb7e-883c-a091-feec-27f3937491ab@toxicpanda.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <83d21549-66a0-0e76-89e5-1303c5b19102@kernel.dk>
Date: Tue, 21 Jan 2020 14:25:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <82a3eb7e-883c-a091-feec-27f3937491ab@toxicpanda.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5AXNSaifLnJ.A.X0C.wA3JeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/779
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/83d21549-66a0-0e76-89e5-1303c5b19102@kernel.dk
Resent-Date: Tue, 21 Jan 2020 21:42:08 +0000 (UTC)

On 1/21/20 7:00 AM, Josef Bacik wrote:
> On 1/21/20 7:48 AM, Sun Ke wrote:
>> When kzalloc fail, may cause trying to destroy the
>> workqueue from inside the workqueue.
>>
>> If num_connections is m (2 < m), and NO.1 ~ NO.n
>> (1 < n < m) kzalloc are successful. The NO.(n + 1)
>> failed. Then, nbd_start_device will return ENOMEM
>> to nbd_start_device_ioctl, and nbd_start_device_ioctl
>> will return immediately without running flush_workqueue.
>> However, we still have n recv threads. If nbd_release
>> run first, recv threads may have to drop the last
>> config_refs and try to destroy the workqueue from
>> inside the workqueue.
>>
>> To fix it, add a flush_workqueue in nbd_start_device.
>>
>> Fixes: e9e006f5fcf2 ("nbd: fix max number of supported devs")
>> Signed-off-by: Sun Ke <sunke32@huawei.com>
>> ---
>>   drivers/block/nbd.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index b4607dd96185..dd1f8c2c6169 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -1264,7 +1264,12 @@ static int nbd_start_device(struct nbd_device *nbd)
>>   
>>   		args = kzalloc(sizeof(*args), GFP_KERNEL);
>>   		if (!args) {
>> -			sock_shutdown(nbd);
>> +			if (i == 0)
>> +				sock_shutdown(nbd);
>> +			else {
>> +				sock_shutdown(nbd);
>> +				flush_workqueue(nbd->recv_workq);
>> +			}
> 
> Just for readability sake why don't we just flush_workqueue()
> unconditionally, and add a comment so we know why in the future.

Or maybe just make it:

	sock_shutdown(nbd);
	if (i)
		flush_workqueue(nbd->recv_workq);

which does the same thing, but is still readable. The current code with
the shutdown duplication is just a bit odd. Needs a comment either way.

-- 
Jens Axboe


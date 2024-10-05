Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6E29913DD
	for <lists+nbd@lfdr.de>; Sat,  5 Oct 2024 03:57:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 04FE5207CA; Sat,  5 Oct 2024 01:57:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Oct  5 01:57:12 2024
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1E60320784
	for <lists-other-nbd@bendel.debian.org>; Sat,  5 Oct 2024 01:41:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id MleKqnOo7NPW for <lists-other-nbd@bendel.debian.org>;
	Sat,  5 Oct 2024 01:41:13 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pl1-x62c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A6B262078F
	for <nbd@other.debian.org>; Sat,  5 Oct 2024 01:41:13 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20b90984971so28649515ad.3
        for <nbd@other.debian.org>; Fri, 04 Oct 2024 18:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1728092469; x=1728697269; darn=other.debian.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUj5Q8Oaq99Jq3sBB6jeIQ4hAZm7itRv4sV13fDobkk=;
        b=QqkrJekR7CTHfSjbgSJACySpb4VvCI+8QEJ8xtUqfC7E8gVlBO6ljLI1evu/GOI/MW
         AhbcWwlGXEZwvPcf7zspsyNExUo4nttd8TrLAQ4fZ4HbWrP3rLbLuxqOJMX8AUuteaZO
         n8rwY87nssty/EhS4FaM54M8LnQkiIpPh0kp+G0lR/O+b+cxyQ9O3hNZScaHUK+H+y/V
         cY/u/uVC5f932mrADsJTDAzkzG7obeGYT1yKDvAHLh+axykOxzWWyHP8GsfCATeJoGO4
         3Aecn/1FSdoTPkFJIYmakxNyNnFyVk+m45kBZLR1SShyRPjnahtHyEn9qAY9B3akDFNK
         sK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728092469; x=1728697269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUj5Q8Oaq99Jq3sBB6jeIQ4hAZm7itRv4sV13fDobkk=;
        b=LiXdEWhzPbmyYVJMDP4du/aoDGXRD5VFQTJd9BT/baSlJTVY5csxwENHFvqTHWOUXe
         MqSUuT61P8sgShMkXTSlNiXLjeR9f6FCyiZky9zFE3/rYKOuF6vtewWXxSsSLi8/SUC1
         H08ZNNK+V5JIu7bQzVpF1fr4qjsRozM19g7/lVy0+RfkTu5Fh4AO22mhpgn/hTBXbV2d
         At+LhZWo5UatlFgq2+zIqgnz6pPjaDuaZWTsifdnyZS2UlDQ+rpm6tuNAzKrOLQcyopV
         B7p/lCVabxGlve7cfbO+WAx3CmBAs1i70IFn9msMwg85sVh20vVPOjBjcTwwFlHdcbur
         CxoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoOdk10H8NNtvXIECzhUrogZ7xaNrbaF4jaUhfLUpEFJYtBQyALY+yAfSSFs3BCH8yjGs=@other.debian.org
X-Gm-Message-State: AOJu0Yw8Nas27t/u8LWfMK8eoErGUf4ce+ko8VmRN+Y8tZxeuD9Ssx+d
	eT+8ZWsA09z89l+/50ul4wMA5102SCx39KKpD8ebWymFE4NvnrmIxtCBNdjD02g=
X-Google-Smtp-Source: AGHT+IHvZWO7L9pO25Kvnfy0cJ2v4rBQB23dVFBbTWYiGKsJlCF/PSI0q+ybt7P6TqG0rO3g149Q5Q==
X-Received: by 2002:a17:902:fc84:b0:20b:a6f5:2768 with SMTP id d9443c01a7336-20bfde650dfmr59873175ad.10.1728092469699;
        Fri, 04 Oct 2024 18:41:09 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cff51sm4634235ad.87.2024.10.04.18.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 18:41:08 -0700 (PDT)
Message-ID: <c5c3c7d7-2db9-44fe-a316-b0b5bab30f1e@kernel.dk>
Date: Fri, 4 Oct 2024 19:41:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: blktests failures with v6.12-rc1 kernel
To: Zhu Yanjun <yanjun.zhu@linux.dev>, Bart Van Assche <bvanassche@acm.org>,
 Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
References: <xpe6bea7rakpyoyfvspvin2dsozjmjtjktpph7rep3h25tv7fb@ooz4cu5z6bq6>
 <e6e6f77b-f5c6-4b1e-8ab2-b492755857f0@acm.org>
 <dvpmtffxeydtpid3gigfmmc2jtp2dws6tx4bc27hqo4dp2adhv@x4oqoa2qzl2l>
 <5cff6598-21f3-4e85-9a06-f3a28380585b@linux.dev>
 <9fe72efb-46b8-4a72-b29c-c60a8c64f88c@acm.org>
 <b60fa0ab-591b-41e8-9fca-399b6a25b6d9@linux.dev>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <b60fa0ab-591b-41e8-9fca-399b6a25b6d9@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tj1_6rqkC4D.A.qJSM.4zJAnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3158
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/c5c3c7d7-2db9-44fe-a316-b0b5bab30f1e@kernel.dk
Resent-Date: Sat,  5 Oct 2024 01:57:13 +0000 (UTC)

On 10/4/24 7:26 PM, Zhu Yanjun wrote:
> 
> ? 2024/10/5 0:31, Bart Van Assche ??:
>> On 10/4/24 5:40 AM, Zhu Yanjun wrote:
>>> So I add a jiffies (u64) value into the name.
>>
>> I don't think that embedding the value of the jiffies counter in the kmem cache names is sufficient to make cache names unique. That sounds like a fragile approach to me.
> 
> Sorry. I can not get you. Why jiffies counter is not sufficient to
> make cache names unique? And why is it a fragile approach?

1 jiffy is an eternity, what happens if someone calls
kmem_cache_create() twice in that window?

> I read your latest commit. In your commit, the ida is used to make
> cache names unique. It is a good approach if it can fix this problem.

That seems over-engineered. Seems to me that either these things should
share a slab cache (why do they need one each, if they are the same
sized object?!). And if they really do need one, surely something ala:

static atomic_long_t slab_index;

sprintf(slab_name, "foo-%ld", atomic_inc_return(&slab_index));

would be all you need.

-- 
Jens Axboe


Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C91B50044
	for <lists+nbd@lfdr.de>; Tue,  9 Sep 2025 16:54:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 33B9B2059A; Tue,  9 Sep 2025 14:54:24 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  9 14:54:24 2025
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	FVGT_m_MULTI_ODD autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E3E5720566
	for <lists-other-nbd@bendel.debian.org>; Tue,  9 Sep 2025 14:37:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id r34Eaw_8YVSx for <lists-other-nbd@bendel.debian.org>;
	Tue,  9 Sep 2025 14:37:32 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-il1-x12e.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D01902050E
	for <nbd@other.debian.org>; Tue,  9 Sep 2025 14:37:32 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-40b035b23c6so9585065ab.2
        for <nbd@other.debian.org>; Tue, 09 Sep 2025 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1757428649; x=1758033449; darn=other.debian.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GJnzswevlDUuq/OfoxD0pVudGLoTsCpDMKvJC+rT6Cg=;
        b=MMdBnHCZuQOTA83oBDpYbNbJ8k0m+Rfy+P7fzEi8NRYHTZmpYZcNY5DPsNUsTeGOdn
         rvc6kNaU3qCtSK6t/J6Zv/ep61DKa+8kmqvWCeOQZiOqI3mnM7lZ9FLb0XEIgZoEtgo+
         82RiHpcryA4hYD0x1G+hll1z7LqTtNnBZ3iKIQaN6CiTM858JrGfzmYFrUzDv0JfLRsW
         i55JsQxEKBwJUgw3PIjEhh6aQoId7FIEyOZLXkANHryUEuX9+9PIaXnxyHc8UeQa6uo0
         ghfxPGSUIb1Op9sGJZCifOj4KTeqXQwrociYgkiFxtnTBKp2CB9yR3AuWu2TFJsmQtuU
         5mCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757428649; x=1758033449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GJnzswevlDUuq/OfoxD0pVudGLoTsCpDMKvJC+rT6Cg=;
        b=B7uHKxi/ogVj05NLyOcmoeaY4U4nTtrHpAhl+tA0Oxind7SKgM+JooFtB8fONMlPA7
         kXBUN/HyBmpnJg2fgx3Mng36jHhAVJEEoF5fv0fiEEcGQe+PBtOOHfHQEzk4NSDqu2Iw
         Cr+nCl8M/RSEo/ibvM/PpY/0HCadTjS30zodXMM8IrpFpjYxMAdVuUxdJo9cOtaVmepq
         NkkgJdU+RvRTjoftFSBi1xZ8TbUDgwdcUfR0J8bjNr7Plq+92b8DIokwz/g2BnO14y7D
         87magAShpG/Vc1MPsmBrxOHx0Ky4Fsej8IibBbMzH22a0Cvg7zdzmyiq14nwYnI98sH+
         K/3A==
X-Forwarded-Encrypted: i=1; AJvYcCUucCRyHZ+gMD1191OZdxk/3sg3TAGz+R0Dx8GXFd04FkVnZwP4+R0DWdQRU4q0ih3yWAA=@other.debian.org
X-Gm-Message-State: AOJu0YzrZf8NGcIkU+WDeIncCGtdCGDqJMq2vwr3ui3mZZ7WxBL1NKwi
	VbMkLkY4360pjAmtcxHcaZDfUgM/SrdCBqYkYE7c2gBKwhf6n7XrfHn/OL6P9w/ugA8=
X-Gm-Gg: ASbGncsMC2/yymNI6SrnGlmkt+iKBmXWuRuVYeImrpMKlS23Gv1Sj+Idco5cEjut1Pp
	oc5iBpKSN+cKj/dbwFGqNXtRsP+pQscriPbIshvqLsGkOCeU1jYvnufFOcacWPs7wsFxZmhEtL6
	wYX0a8QWIczl4RPEIqZVh+0sv3eNJ3k7Ygu/i90crA7ibgeZxrbqVlnY4D79ZlhAniOk3535eRf
	cJaZqJElrrcPY+h/AXs/x9DmHJ2lknPbLnfheVPSldRquXnPGVyRUAp10cg+zuAvAhAq6v5IXbo
	OBbC2zUFIVzW7kHcl0sA5sxNj46NvonRdeJf4RvQ5GiMhrav5ZFjuOZq1bUor0XL0CYKjy6uQcn
	RDpcn9irKXKKsSkpdPNF2zRkPsVKXwg==
X-Google-Smtp-Source: AGHT+IFFRSb/tnom+YwXf9uhxtCm5e69yWnLr+MwUSsv+r9w/hXHhYam53Z1HpV1oSqQ0qe9EVHAew==
X-Received: by 2002:a05:6e02:1a63:b0:414:cb8e:a801 with SMTP id e9e14a558f8ab-414cb8ebdffmr10529905ab.29.1757428648340;
        Tue, 09 Sep 2025 07:37:28 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ece96399csm9130641173.20.2025.09.09.07.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 07:37:27 -0700 (PDT)
Message-ID: <63c99735-80ba-421f-8ad4-0c0ec8ebc3ea@kernel.dk>
Date: Tue, 9 Sep 2025 08:37:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nbd: restrict sockets to TCP and UDP
To: Eric Dumazet <edumazet@google.com>, "Richard W.M. Jones"
 <rjones@redhat.com>
Cc: Josef Bacik <josef@toxicpanda.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org,
 Eric Dumazet <eric.dumazet@gmail.com>,
 syzbot+e1cd6bd8493060bd701d@syzkaller.appspotmail.com,
 Mike Christie <mchristi@redhat.com>, Yu Kuai <yukuai1@huaweicloud.com>,
 linux-block@vger.kernel.org, nbd@other.debian.org
References: <20250909132243.1327024-1-edumazet@google.com>
 <20250909132936.GA1460@redhat.com>
 <CANn89iLyxMYTw6fPzUeVcwLh=4=iPjHZOAjg5BVKeA7Tq06wPg@mail.gmail.com>
 <CANn89iKdKMZLT+ArMbFAc8=X+Pp2XaVH7H88zSjAZw=_MvbWLQ@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CANn89iKdKMZLT+ArMbFAc8=X+Pp2XaVH7H88zSjAZw=_MvbWLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zzPmkqYV4XF.A.yQED.g-DwoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3436
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/63c99735-80ba-421f-8ad4-0c0ec8ebc3ea@kernel.dk
Resent-Date: Tue,  9 Sep 2025 14:54:24 +0000 (UTC)

On 9/9/25 8:35 AM, Eric Dumazet wrote:
> On Tue, Sep 9, 2025 at 7:04 AM Eric Dumazet <edumazet@google.com> wrote:
>>
>> On Tue, Sep 9, 2025 at 6:32 AM Richard W.M. Jones <rjones@redhat.com> wrote:
>>>
>>> On Tue, Sep 09, 2025 at 01:22:43PM +0000, Eric Dumazet wrote:
>>>> Recently, syzbot started to abuse NBD with all kinds of sockets.
>>>>
>>>> Commit cf1b2326b734 ("nbd: verify socket is supported during setup")
>>>> made sure the socket supported a shutdown() method.
>>>>
>>>> Explicitely accept TCP and UNIX stream sockets.
>>>
>>> I'm not clear what the actual problem is, but I will say that libnbd &
>>> nbdkit (which are another NBD client & server, interoperable with the
>>> kernel) we support and use NBD over vsock[1].  And we could support
>>> NBD over pretty much any stream socket (Infiniband?) [2].
>>>
>>> [1] https://libguestfs.org/nbd_aio_connect_vsock.3.html
>>>     https://libguestfs.org/nbdkit-service.1.html#AF_VSOCK
>>> [2] https://libguestfs.org/nbd_connect_socket.3.html
>>>
>>> TCP and Unix domain sockets are by far the most widely used, but I
>>> don't think it's fair to exclude other socket types.
>>
>> If we have known and supported socket types, please send a patch to add them.
>>
>> I asked the question last week and got nothing about vsock or other types.
>>
>> https://lore.kernel.org/netdev/CANn89iLNFHBMTF2Pb6hHERYpuih9eQZb6A12+ndzBcQs_kZoBA@mail.gmail.com/
>>
>> For sure, we do not want datagram sockets, RAW, netlink, and many others.
> 
> BTW vsock will probably fire lockdep warnings, I see GFP_KERNEL being used
> in net/vmw_vsock/virtio_transport.c
> 
> So you will have to fix this.

Rather than play whack-a-mole with this, would it make sense to mark as
socket as "writeback/reclaim" safe and base the nbd decision on that rather
than attempt to maintain some allow/deny list of sockets?

-- 
Jens Axboe


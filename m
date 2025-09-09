Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 65862B50118
	for <lists+nbd@lfdr.de>; Tue,  9 Sep 2025 17:27:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3D9B32051D; Tue,  9 Sep 2025 15:27:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  9 15:27:11 2025
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	FVGT_m_MULTI_ODD,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C7C76205A0
	for <lists-other-nbd@bendel.debian.org>; Tue,  9 Sep 2025 15:09:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id K_qA-CTQuQBP for <lists-other-nbd@bendel.debian.org>;
	Tue,  9 Sep 2025 15:09:38 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd2c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 61F6920515
	for <nbd@other.debian.org>; Tue,  9 Sep 2025 15:09:38 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-88432e1af6dso402151239f.2
        for <nbd@other.debian.org>; Tue, 09 Sep 2025 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1757430574; x=1758035374; darn=other.debian.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBkHzWz2WSvAv3P+4fdRCtFI9r1yFcrUi6CJvq5A8BM=;
        b=xdHezH9XctR3D0LPhmhG3aYEy0w5ESGw+AXKokcVBkcU1hyEAsiszY4kaybhUubO0W
         ek+Le0j+VEZxrq7NHZKPwECInr1mkevfZfaL0Gw+iUYFez/Vkdr2L+Hi1TRtc5ccWYp3
         piWcFpXXIaBh0rQmOYeEvFolULH6YV7fUHTf5pM97povvOd9ILsZw6Wn4UqL/PcmK4sF
         xUc/QuOHU0rNUSxFlN1JawraSznnVI2VtI2TW06remn0BBFrFVpQAw6pUhUEpi1NAGMU
         H9MMWWORWdppr0dcS4qgz2lr6/H4T2aGo7jfA9aLtUb4eNrKruvVO1hG+10EJ0z5kPyo
         p0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757430574; x=1758035374;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBkHzWz2WSvAv3P+4fdRCtFI9r1yFcrUi6CJvq5A8BM=;
        b=FMfb68mRz9IWXgf8lz/53FHSupqOCZKhtH1mZSSetx8n0D6PndG+Hw1O7i7qyN7DuP
         CWPVezaEGN6DHzqbd5nQ2DO97QsFU6EDFQaGxmYXsmcCndngGrnVd15ap7i7EluPYXMU
         UcHHBFtIXYqnwwUdJeT3iTep7rH0zAzG4wOMeCVIViS666KaiaOH4/AqYBvWrZeoq+t/
         z1DGuoYLK9wUGj5t+17YCNSICtJynBEXYJ+DT504/KdHe5gSy3icUxKsiyWOFPOxdH0Y
         PYWdkw8hUTOvvsN2fUfI6OQxh53OLOYIdw+iIY4J1yLioC5Jp6+aq7qLwIhl34tc+nXO
         zPGg==
X-Forwarded-Encrypted: i=1; AJvYcCXd4tzW5T6bbaS9ytYpw9hkpc7g17ay9k7zJqLeuh61zzDLfpdOoRCSieTxiAVPyayACBM=@other.debian.org
X-Gm-Message-State: AOJu0YwwJBH8uh1Kif/hnkXLlF6Xbfu4ZpJtjriUz7+um6ICaRSOwbK2
	XP0KZlr3+lUPOZbpeqjnVaf6lOdClKs/qbtChjIUwUe0V6nqno7eNxhY9QOUKYxSiKE=
X-Gm-Gg: ASbGncu5Vv2Pfaqh9dig5C34y1wfNk5wtLSQ4IIgCr14eJGxTpdvQLZ950y6aJ1LM4E
	0oKM1vgbhm21XJoSRIr1oyCUTXS5Qsy3ZmdzR5gxtVe8I4J/OQQ54LWl0YqX795c03EacP3DJFX
	oFwmU7ApP7S3WA3PIiOVtPR9gHA8i/mqC+pqddYKfeRW/RxXlk+1wYm+QJ43e8m+DlcYCB1XDYD
	z8hUGX2M3+57VOH0JT4BzU/lBOQLWJbzsUdAreePa8rlB3B9F8Z81OniDV68VL89tKcyVkJ0TIv
	aegeYIhAcvw481ZVdbg6GTntqZcrAP8AaZUbZCpyB/zEw6ShQhGzK/SHGBxRO83Av6VYKET19Rs
	YusJsMKPvQPEUsL+Qqm2ajvL4lJMS7Q==
X-Google-Smtp-Source: AGHT+IEaLNl8zaGVmv/a45LKfh9YWrlicYBfVn4ysOSEgq8X+b4uOPf1vxmee+GBDunypTo5Eyf8Ug==
X-Received: by 2002:a05:6e02:1d99:b0:3fd:5836:2318 with SMTP id e9e14a558f8ab-3fd8e98d323mr176147975ab.11.1757430573191;
        Tue, 09 Sep 2025 08:09:33 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-403952954dasm31357415ab.26.2025.09.09.08.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 08:09:32 -0700 (PDT)
Message-ID: <e1161184-e2fa-49eb-8093-0b754dc362c1@kernel.dk>
Date: Tue, 9 Sep 2025 09:09:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nbd: restrict sockets to TCP and UDP
To: Eric Dumazet <edumazet@google.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>,
 Josef Bacik <josef@toxicpanda.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org,
 Eric Dumazet <eric.dumazet@gmail.com>,
 syzbot+e1cd6bd8493060bd701d@syzkaller.appspotmail.com,
 Mike Christie <mchristi@redhat.com>, Yu Kuai <yukuai1@huaweicloud.com>,
 linux-block@vger.kernel.org, nbd@other.debian.org
References: <20250909132243.1327024-1-edumazet@google.com>
 <20250909132936.GA1460@redhat.com>
 <CANn89iLyxMYTw6fPzUeVcwLh=4=iPjHZOAjg5BVKeA7Tq06wPg@mail.gmail.com>
 <CANn89iKdKMZLT+ArMbFAc8=X+Pp2XaVH7H88zSjAZw=_MvbWLQ@mail.gmail.com>
 <63c99735-80ba-421f-8ad4-0c0ec8ebc3ea@kernel.dk>
 <CANn89iJiBuJ=sHbfKjR-bJe6p12UrJ_DkOgysmAQuwCbNEy8BA@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <CANn89iJiBuJ=sHbfKjR-bJe6p12UrJ_DkOgysmAQuwCbNEy8BA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jsJvDJhrr8K.A.bTPD.PdEwoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3439
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e1161184-e2fa-49eb-8093-0b754dc362c1@kernel.dk
Resent-Date: Tue,  9 Sep 2025 15:27:11 +0000 (UTC)

On 9/9/25 8:47 AM, Eric Dumazet wrote:
> On Tue, Sep 9, 2025 at 7:37?AM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 9/9/25 8:35 AM, Eric Dumazet wrote:
>>> On Tue, Sep 9, 2025 at 7:04?AM Eric Dumazet <edumazet@google.com> wrote:
>>>>
>>>> On Tue, Sep 9, 2025 at 6:32?AM Richard W.M. Jones <rjones@redhat.com> wrote:
>>>>>
>>>>> On Tue, Sep 09, 2025 at 01:22:43PM +0000, Eric Dumazet wrote:
>>>>>> Recently, syzbot started to abuse NBD with all kinds of sockets.
>>>>>>
>>>>>> Commit cf1b2326b734 ("nbd: verify socket is supported during setup")
>>>>>> made sure the socket supported a shutdown() method.
>>>>>>
>>>>>> Explicitely accept TCP and UNIX stream sockets.
>>>>>
>>>>> I'm not clear what the actual problem is, but I will say that libnbd &
>>>>> nbdkit (which are another NBD client & server, interoperable with the
>>>>> kernel) we support and use NBD over vsock[1].  And we could support
>>>>> NBD over pretty much any stream socket (Infiniband?) [2].
>>>>>
>>>>> [1] https://libguestfs.org/nbd_aio_connect_vsock.3.html
>>>>>     https://libguestfs.org/nbdkit-service.1.html#AF_VSOCK
>>>>> [2] https://libguestfs.org/nbd_connect_socket.3.html
>>>>>
>>>>> TCP and Unix domain sockets are by far the most widely used, but I
>>>>> don't think it's fair to exclude other socket types.
>>>>
>>>> If we have known and supported socket types, please send a patch to add them.
>>>>
>>>> I asked the question last week and got nothing about vsock or other types.
>>>>
>>>> https://lore.kernel.org/netdev/CANn89iLNFHBMTF2Pb6hHERYpuih9eQZb6A12+ndzBcQs_kZoBA@mail.gmail.com/
>>>>
>>>> For sure, we do not want datagram sockets, RAW, netlink, and many others.
>>>
>>> BTW vsock will probably fire lockdep warnings, I see GFP_KERNEL being used
>>> in net/vmw_vsock/virtio_transport.c
>>>
>>> So you will have to fix this.
>>
>> Rather than play whack-a-mole with this, would it make sense to mark as
>> socket as "writeback/reclaim" safe and base the nbd decision on that rather
>> than attempt to maintain some allow/deny list of sockets?
> 
> Even if a socket type was writeback/reclaim safe, probably NBD would
> not support arbitrary socket type, like netlink, af_packet, or
> af_netrom.
> 
> An allow list seems safer to me, with commits with a clear owner.
> 
> If future syzbot reports are triggered, the bisection will point to
> these commits.

That's fine too, either approach will result in fixups, at the end of
the day. And followup related fixes to solve issues with socket types
that we do deem useful, like the vsock one you already found.

-- 
Jens Axboe


Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DDE7B5B59
	for <lists+nbd@lfdr.de>; Mon,  2 Oct 2023 21:33:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AB9782090A; Mon,  2 Oct 2023 19:33:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct  2 19:33:13 2023
Old-Return-Path: <samuel.holland@sifive.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2CC65208DD
	for <lists-other-nbd@bendel.debian.org>; Mon,  2 Oct 2023 19:15:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.8 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zWPMTHJcSXdX for <lists-other-nbd@bendel.debian.org>;
	Mon,  2 Oct 2023 19:15:42 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .sifive. - helo: .mail-io1-xd33.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 720BE208F0
	for <nbd@other.debian.org>; Mon,  2 Oct 2023 19:15:42 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-79f95439795so78226639f.0
        for <nbd@other.debian.org>; Mon, 02 Oct 2023 12:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1696274138; x=1696878938; darn=other.debian.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wfpu0g7eWR/bD6NFg1Hw3uuA6aj8ndONfL3cIV4EkSU=;
        b=mdEsU89Exb7RfPvrrbT11iJJkR69J7UniTplAiPVC/g4W0e2V0MtNLQxQpwUZuQORk
         dgdoerGetVtdpSj5MKVShX0pBlK4L04G7ZsA8n8yfCz2wQfCL7GJdJz6KiREZPXFoRDu
         SbU5k/BcI+rW4iYkGPalQNyOjOvqd74RJZv9ejV8CsqDv/Du1QMbJYvcMFXALkc+1qY4
         x2kmSZmahQziAMtq5k0fEei5Q0+XhwMC5iBKmczQJYbCrzmJbDMpGtCXTUaGx4BI3EM3
         92EUouFcDGdI5iDUXOhLR8pM2JeRhmzPSPh+Ggvab0X1JO9juGxM4b1iqpHlGu0DsbUp
         utSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696274138; x=1696878938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wfpu0g7eWR/bD6NFg1Hw3uuA6aj8ndONfL3cIV4EkSU=;
        b=WgIGAOdlyaZwwaz3K6xlWlfnZY1vwUVmIV+OriKmMed8uL9fRj0m+i7EeI2lLgDsfW
         1LiKaJ4pyZUUkvm3raQ6sVCJe4OWJshliPL5FbBUNccn6jD54JpwWYb4uiNbDpnC6KP1
         Vto8OV9J6Z4JTzDjfBAbNxKoSDhlywYKpPpTYL8S75I+FhEUxfJT/zkBEerDtuTccwg5
         X0+FEQgPRJtpys/j/LqXsG7bwAgXrQUzeuIZHTzJoo/w5pqvCkZ5RSpqwULUxXDpt+8y
         Ze1JrcLOQ776EpQVe5ZVdK/LNtLFrTtD8GjChpXQtoMtNZKdOZATXV1fldHeAIei3FLZ
         wuRQ==
X-Gm-Message-State: AOJu0YzYh04fsv75sVaoGb80Zg+P0YkALV5rHj8a+T08MzQ3Va9m5h9O
	Wi336rEq4f/ic+Ee62ThJLhsTw==
X-Google-Smtp-Source: AGHT+IHuLrLT0lmZmHDMHS0OHH96XERxHL7pJTE9KoIBXxmJHQADQKTERwsFpskdzZvEU4f1iF1V2A==
X-Received: by 2002:a05:6e02:1d93:b0:351:2053:f4a with SMTP id h19-20020a056e021d9300b0035120530f4amr485145ila.3.1696274138264;
        Mon, 02 Oct 2023 12:15:38 -0700 (PDT)
Received: from ?IPV6:2605:a601:adae:4500:71c9:1cd3:823e:b180? ([2605:a601:adae:4500:71c9:1cd3:823e:b180])
        by smtp.gmail.com with ESMTPSA id w5-20020a056638030500b0043a1fe337b9sm7192769jap.170.2023.10.02.12.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 12:15:37 -0700 (PDT)
Message-ID: <3a5e1f6e-5fa9-46ea-8828-ca4679bf0c77@sifive.com>
Date: Mon, 2 Oct 2023 14:15:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] nbd: call blk_mark_disk_dead in
 nbd_clear_sock_ioctl
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Wouter Verhelst <w@uter.be>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Denis Efremov <efremov@linux.com>, Josef Bacik <josef@toxicpanda.com>,
 Stefan Haberland <sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
 David Sterba <dsterba@suse.com>, linux-block@vger.kernel.org,
 nbd@other.debian.org, linux-s390@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
References: <20230811100828.1897174-1-hch@lst.de>
 <20230811100828.1897174-8-hch@lst.de>
 <79af9398-167f-440e-a493-390dc4ccbd85@sifive.com>
 <20230925074838.GA28522@lst.de> <ZRmoHaSojk6ra5OU@pc220518.home.grep.be>
 <20231002062159.GB1140@lst.de>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231002062159.GB1140@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4ih6ugBLZdD.A.wNG.5rxGlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2656
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/3a5e1f6e-5fa9-46ea-8828-ca4679bf0c77@sifive.com
Resent-Date: Mon,  2 Oct 2023 19:33:13 +0000 (UTC)

On 2023-10-02 1:21 AM, Christoph Hellwig wrote:
> On Sun, Oct 01, 2023 at 07:10:53PM +0200, Wouter Verhelst wrote:
>>> So what are the semantics of clearing the socket?
>>>
>>> The <= 6.5 behavior of invalidating fs caches, but not actually marking
>>> the fs shutdown is pretty broken, especially if this expects to resurrect
>>> the device and thus the file system later on.
>>
>> nbd-client -d calls
>>
>> ioctl(nbd, NBD_DISCONNECT);
>> ioctl(nbd, NBD_CLEAR_SOCK);
>>
>> (error handling removed for clarity)
>>
>> where "nbd" is the file handle to the nbd device. This expects that the
>> device is cleared and that then the device can be reused for a different
>> connection, much like "losetup -d". Expecting that the next connection
>> would talk to the same file system is wrong.
> 
> So a fs shutdown seems like a the right thing.  So I'm a little confused
> on what actualy broke here.

I'm not too familiar with the block subsystem, but my understanding is that
blk_mark_disk_dead(nbd->disk) is permanent -- there is no way to un-mark a disk
as dead. So this makes the device (e.g. /dev/nbd0) permanently unusable after
the call to ioctl(nbd, NBD_CLEAR_SOCK).

Like Wouter said, the semantics should be similar to a loop device, where the
same block device can be reused after being disconnected. That was why I
suggested disk_force_media_change() as called from __loop_clr_fd(). The loop
driver doesn't call blk_mark_disk_dead() anywhere.

Regards,
Samuel


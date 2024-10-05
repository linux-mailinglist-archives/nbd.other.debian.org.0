Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 49318991B28
	for <lists+nbd@lfdr.de>; Sun,  6 Oct 2024 00:03:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E2C692085A; Sat,  5 Oct 2024 22:03:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Oct  5 22:03:10 2024
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D1FB0207C3
	for <lists-other-nbd@bendel.debian.org>; Sat,  5 Oct 2024 21:45:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id iUh9B-eHeVT1 for <lists-other-nbd@bendel.debian.org>;
	Sat,  5 Oct 2024 21:45:52 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pf1-x429.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 792FB2071C
	for <nbd@other.debian.org>; Sat,  5 Oct 2024 21:45:52 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71df468496fso713156b3a.1
        for <nbd@other.debian.org>; Sat, 05 Oct 2024 14:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1728164748; x=1728769548; darn=other.debian.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmK9Xs58S08yxjMtYHm+HrNkToU7fdzXxnd+5Lv0Xns=;
        b=ubKfRuTmQxqQrChI86LmqmZy2w4s5ikP71hHQOkmeAQzfQbLRM2zu7fs8lXtiXIdd3
         nQ+948qJGYa9yLLKyIsoGx7P7ttY45Iz2WNhNAkbkyqepgP754X1LLURfqe+ZKX7YUdp
         ci/aNKZRc8AdaDB4bkDmQRVN0irqW/obuv01N/RbOQRgVP+NfMQ6LxGelfeJSfLJ6BAF
         DiRdc31jOI4HGR2i2Pwwoporjs/hLaJ9QoejXmK5jyjJ4b8pbUkkOq1sMgKgsV5EB5EZ
         6rD5wOK4uLdW1tAlRanCsfeqirobl/hxw9tnFJ7C7XY11wwT8HXOMZai/YFE60aAF21f
         s+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728164748; x=1728769548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmK9Xs58S08yxjMtYHm+HrNkToU7fdzXxnd+5Lv0Xns=;
        b=aWIciC+n68ex+Htmsaxf10KPecSRpAQCgN7n2CPOrowm4m6s7aiewr1ftk6YO8XLSp
         L0fzj8bjCczyBo5iLhMQ3vjC5c+h8hntJckYSMwyM/05CBFom1k1VYmTW1rQClGbO8q7
         14+Xq88VQ3ytYnrB/l+PljONPptTBrdG8VU/h6Hb2o+fYCefYmN14aZibx/rTAC5hrWm
         TiBFmdpzQHGj6Q983/5HrR7oEgFQ6TWhTgfpcQV6UjLBX0Tx1QUE88foDyGje0cF8SMa
         bO/a9bobWPu1L8X2L/N19PYX/xcVKw+u4kJGaTIwovGaurCFBwKAiXoHJ62UFcT79pMD
         QdMw==
X-Forwarded-Encrypted: i=1; AJvYcCV+z7mmf/Z2P8GNUIf6Z5+YAzXvrPj+jpFFww6SPRZH+5v4AclxUJbfGEZ+HeS/y9jdryU=@other.debian.org
X-Gm-Message-State: AOJu0YwrvwmbnORoWf+llbAmQfKahjOqNe8xfxz0CTvQdNFFXBvGOPxD
	OFEgVpeWQRBKXv3Cb5CzpSaRLH/DFjBUKyEDOhag1h/KLx79MkHvdH3ccy+3EiQ=
X-Google-Smtp-Source: AGHT+IF2CIeoWIaR7M9L7MG4cg5BH98dJB3GOpxAS+7PQNC9MiHoMI9+gMzk9ipUOljcrFRhvDz1NQ==
X-Received: by 2002:a05:6a20:2d22:b0:1d2:e504:52ba with SMTP id adf61e73a8af0-1d6dfabb7ebmr11814308637.38.1728164748471;
        Sat, 05 Oct 2024 14:45:48 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d69246sm1882056b3a.182.2024.10.05.14.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 14:45:47 -0700 (PDT)
Message-ID: <dd003ffd-c63a-496a-8585-52fbb08c2189@kernel.dk>
Date: Sat, 5 Oct 2024 15:45:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: blktests failures with v6.12-rc1 kernel
To: Bart Van Assche <bvanassche@acm.org>, Zhu Yanjun <yanjun.zhu@linux.dev>,
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
 <c5c3c7d7-2db9-44fe-a316-b0b5bab30f1e@kernel.dk>
 <d5fe08b6-68df-4d67-8870-dd7ae391973e@acm.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <d5fe08b6-68df-4d67-8870-dd7ae391973e@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ibdwWerT16P.A.hXcM.eebAnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3161
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/dd003ffd-c63a-496a-8585-52fbb08c2189@kernel.dk
Resent-Date: Sat,  5 Oct 2024 22:03:10 +0000 (UTC)

On 10/5/24 3:36 PM, Bart Van Assche wrote:
> On 10/4/24 6:41 PM, Jens Axboe wrote:
>> That seems over-engineered. Seems to me that either these things should
>> share a slab cache (why do they need one each, if they are the same
>> sized object?!).
> 
> The size of two of the three slab caches is variable.
> 
>> And if they really do need one, surely something ala:
>>
>> static atomic_long_t slab_index;
>>
>> sprintf(slab_name, "foo-%ld", atomic_inc_return(&slab_index));
>>
>> would be all you need.
> 
> A 32-bit counter wraps around after about 4 billion iterations, isn't
> it?

I did use an atomic_long_t, just forgot to use that for the pseudo
code inc and return. Though I highly doubt it matters in practice...

-- 
Jens Axboe


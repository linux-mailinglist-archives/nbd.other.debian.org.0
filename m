Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D94AD050B
	for <lists+nbd@lfdr.de>; Fri,  6 Jun 2025 17:21:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E40B620592; Fri,  6 Jun 2025 15:21:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun  6 15:21:10 2025
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 361F5206CA
	for <lists-other-nbd@bendel.debian.org>; Fri,  6 Jun 2025 15:03:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YJ7N8z-LGUS8 for <lists-other-nbd@bendel.debian.org>;
	Fri,  6 Jun 2025 15:03:19 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd29.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2E964206E6
	for <nbd@other.debian.org>; Fri,  6 Jun 2025 15:03:16 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-86cdf8349ecso69136339f.2
        for <nbd@other.debian.org>; Fri, 06 Jun 2025 08:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1749222192; x=1749826992; darn=other.debian.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2HMsxKFr+iI0d6Tud/iM7k4FKDD8Q3Y7uGH7YipaKVY=;
        b=O++u1eJS1McaQHmoSmr5jOdI/sdxy86S9CWsEfnes+EOSSRpMZ14YoBbpOykNsfOkL
         Sy47a5jhilS85GzxaYNwEuKQWcxLzfupHJiBzZsyiEHrhj67V6uHjVz6dogejaev5DLs
         nSG75TIm+go5Yk+DLdyTegfSFsm/syCKHtdMhcAndPcf141sQWIC1R5E8WpXPx2VUumD
         KtDJUiwyKPybXgrl/btDMUxTAe+mLWs8Gixh75aqNE2PROq37ibvlFUQfhzqkpFh9znE
         fWdqmnannEn1WP+QjrHHDMJ7bBAkYeYizeqC3/+3j9hC8j5Z7a4X++czb9KJUsS8lBog
         fiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222192; x=1749826992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2HMsxKFr+iI0d6Tud/iM7k4FKDD8Q3Y7uGH7YipaKVY=;
        b=bWEPXWi9OwiSRTml1GIkdu5c2+vvas6nchglOabU2MRxXBcFREuSu+xWMbeLGT8zwL
         pZPHx+2uOGsZEEAf9ndnXjnDLpx8Db4MMPjc7vToEGWCMT2uR82I/mXprSlgEJ9FsvGx
         w8Fr/gVC8wRBbObDDthRPAJ7e3A4JhxC9OTdJ/R4/BJABV4BNeZnUGsGArAvawzSQkUr
         N78JjATQpjw8N0DxDqPJiBI+yYwD1snnK/cjhThDcce7aMGCZUwzLKpSXqo7WyCmq0ix
         zJ+KAtIS3Q+aErESDRhfmF4OC5XnhPw3STprXSK8dO1dv07tDWPYaP1KJQZ2QJIfHLHs
         78Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXX2+1O2zX2HZg5rlXhXE9ml3xlUkm8exUiSANq5ftJfSb9syTCA1s7biEBXw1lxgel6k4=@other.debian.org
X-Gm-Message-State: AOJu0Yx0NomaI2ZZSML+Oi7g8XN/Bc3qSNCjB5U8yhBZQb8b8RfyYsCh
	SEWFVucTP8+sokmsETVtQ+oz25g+dBrI2iVLTuJPrHJtqlXoD6ohXenzuYhO7ZnnjAc=
X-Gm-Gg: ASbGncu1w/IZg5SUqSBivNokoZ1k97WexqG5sl+AA/ZWEBlr/QyWB4qVUE5naTrfG4E
	dZ2lsqYk4PL/InOlC4CymH1+rf24zmUjlhoRWqgWgMlz3w821seXrqesiNGoaMv8ntF26Pr6fo+
	ddWeEWMD28xJwVLZlAm5lsjXNYZDaN9p8Sf1NC3RNiJtIXUJDuI6kbPuOEQNHcURuR9lHNbLcTd
	bkGwU2TMj+FaZ0EDAqmuc7GL6P2Mijdta6T2bEoNgQyjGIPBZ5wJRqncDJOjnaoI/hi9Wgt7iJ+
	waG2LhRNS2n1CVoqkX12oS8MK+AsANVTpSzySc7PNTylYXA=
X-Google-Smtp-Source: AGHT+IG+WbX8uzWkNgXKj6zpzdEmc3KwbYfTHiHsNcFQomIiNJCU7RpTxEKhImMpphBDhSqMdjEhLw==
X-Received: by 2002:a05:6602:6a8a:b0:85b:538e:1faf with SMTP id ca18e2360f4ac-8733666758fmr457995839f.7.1749222192533;
        Fri, 06 Jun 2025 08:03:12 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-500df41fa3esm493580173.30.2025.06.06.08.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 08:03:12 -0700 (PDT)
Message-ID: <14194a5f-e320-45e0-8f6c-019ce3bd4dbe@kernel.dk>
Date: Fri, 6 Jun 2025 09:03:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: blktests failures with v6.15 kernel
To: Daniel Wagner <dwagner@suse.de>, Yi Zhang <yi.zhang@redhat.com>
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Tomas Bzatek <tbzatek@redhat.com>
References: <2xsfqvnntjx5iiir7wghhebmnugmpfluv6ef22mghojgk6gilr@mvjscqxroqqk>
 <7cdceac2-ef72-4917-83a2-703f8f93bd64@flourine.local>
 <rcirbjhpzv6ojqc5o33cl3r6l7x72adaqp7k2uf6llgvcg5pfh@qy5ii2yfi2b2>
 <CAHj4cs8SqXUpbT49v29ugG1Q36g5KrGAHtHu6sSjiH19Ct_vJA@mail.gmail.com>
 <38a8ec1a-dbca-43f1-b0fa-79f0361bbc0b@flourine.local>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <38a8ec1a-dbca-43f1-b0fa-79f0361bbc0b@flourine.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9khqGcybkMJ.A.LWtG.mdwQoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3386
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/14194a5f-e320-45e0-8f6c-019ce3bd4dbe@kernel.dk
Resent-Date: Fri,  6 Jun 2025 15:21:10 +0000 (UTC)

On 6/6/25 8:58 AM, Daniel Wagner wrote:
> FWIW, the contributor for the io_uring feature, stated that it improved
> the performance for some workloads. Though, I think the whole
> integration is sub-optimal, as a new io_uring is created/configured for
> each get_log_page call. So only for a large transfers there is going to
> help.

That's crazy... What commit is that?

-- 
Jens Axboe


Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3E896F74E
	for <lists+nbd@lfdr.de>; Fri,  6 Sep 2024 16:48:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8EC6420BC6; Fri,  6 Sep 2024 14:48:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Sep  6 14:48:12 2024
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2D3F4209F3
	for <lists-other-nbd@bendel.debian.org>; Fri,  6 Sep 2024 14:32:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.01 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id FwThQSqPVpeZ for <lists-other-nbd@bendel.debian.org>;
	Fri,  6 Sep 2024 14:32:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pl1-x635.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 314E3208D2
	for <nbd@other.debian.org>; Fri,  6 Sep 2024 14:32:03 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2068acc8a4fso21844775ad.1
        for <nbd@other.debian.org>; Fri, 06 Sep 2024 07:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1725633120; x=1726237920; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22o0ZzyLZEiafCqX5cQ+ZMjMs0v61dURGbb/IDBuD18=;
        b=Wcq5BvSxU1iQ8Oex+evefVK6eUlV2JZCSv3Ws6DVmlmkaDbeMO4wxckr3KeQJyODnF
         9rQWXaghhOG8tF7xEdpXmQBvmKTYLQY8BfyAWDcAuKwwaiyJTzILQHEZP+cyaVmk/0ha
         qj97+gelCxfyy/LkQS+eZxaxhqgJIqc+4l/+cVDoR+ladUuzIDjE9NcRH1cROrW3FXAm
         +rcCt7myLmygRSx0jHf3FetmBg1g62/k8chEp5qLhxAJAooUPMc7ULt67rV3tFS/p000
         FPWwh0zZg16dYwSgcnHEPPbYhRvMTnWOSWUqSjCsDlY2b/Y3D4MmrZdH003b3EIUPMxu
         Q6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725633120; x=1726237920;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22o0ZzyLZEiafCqX5cQ+ZMjMs0v61dURGbb/IDBuD18=;
        b=WhQCt5duhwtNSQAQ8hmzudof++W1ml/6q73F+stAJlshNRKh9DAOSVF7qY+2b3qXGQ
         u5mddrFYopQhWTvPXioMh0FQ5MOqiVQHPxjORIDTK+q5tUTTuNHj+1nDi41dUGNRCLA6
         7HBQV3OTHcOLmT9QF3Jsv5jBp4UvVndztSZEVbxcC8kataZdYxiugpzsDwM36050OYnu
         70NYiolaLUlJNJIzUwJq9gtn+OgtyD4hujAeFxRc02dgDQLeQS4PLOucK5SQMijHd1cd
         IPXE9fcAAmpxv+dAlAsE9v7X1z+/2U3aEKIpb0OZUMswmNqa/Kwo+pMQxRFmQLYXUuKQ
         ibKA==
X-Forwarded-Encrypted: i=1; AJvYcCV3K7ZaltsTxyHpQYGFG5qwtwrD1SuRSATMX3Ys/C67N99gRiF1iHU5FeSBoRCReyBxSNI=@other.debian.org
X-Gm-Message-State: AOJu0YyL6/YWR6CMkrxWBCbC4aBl5D3nlcW+QUARd5WSP+EPoUKirfXV
	id579tCvvUuotnae1n5jP30hZN4deMzFSsgHN0wowBquRqeoGFeRsPGqxRSWSRM=
X-Google-Smtp-Source: AGHT+IGp6TA5jS245vevFKjB8AnYfnX/DyCCBJVnGWu7AhC5Ng41koXdz2LEtkmRWnVak5lHk9zdFA==
X-Received: by 2002:a17:902:ce0b:b0:206:96ae:dc57 with SMTP id d9443c01a7336-20707001917mr363995ad.48.1725633120088;
        Fri, 06 Sep 2024 07:32:00 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea38539sm43951255ad.130.2024.09.06.07.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:31:59 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Josef Bacik <josef@toxicpanda.com>, Wouter Verhelst <w@uter.be>
Cc: Eric Blake <eblake@redhat.com>, Damien Le Moal <dlemoal@kernel.org>, 
 linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240812133032.115134-1-w@uter.be>
References: <20240812133032.115134-1-w@uter.be>
Subject: Re: [PATCH v4 0/3] nbd: WRITE_ZEROES and a few fixes
Message-Id: <172563311875.172223.11600465596358728901.b4-ty@kernel.dk>
Date: Fri, 06 Sep 2024 08:31:58 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gTSadQDTp2K.A.DSUB.sYx2mB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3146
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/172563311875.172223.11600465596358728901.b4-ty@kernel.dk
Resent-Date: Fri,  6 Sep 2024 14:48:12 +0000 (UTC)


On Mon, 12 Aug 2024 15:20:35 +0200, Wouter Verhelst wrote:
> Implement the WRITE_ZEROES command for the NBD kernel driver. While
> here, add NBD_FLAG_ROTATIONAL to the function that decodes our flags for
> debugfs.
> 

Applied, thanks!

[1/3] nbd: implement the WRITE_ZEROES command
      commit: e49dacc71ec2621ce4c422cd5605d4d06f7807b0
[2/3] nbd: nbd_bg_flags_show: add NBD_FLAG_ROTATIONAL
      commit: 41372f5c9a866365e212809b3543ae8cb5b2542b
[3/3] nbd: correct the maximum value for discard sectors
      commit: 296dbc72d29085d5fc34430d0760423071e9e81d

Best regards,
-- 
Jens Axboe




Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FF36F1004
	for <lists+nbd@lfdr.de>; Fri, 28 Apr 2023 03:33:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 402DD207DD; Fri, 28 Apr 2023 01:33:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr 28 01:33:12 2023
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A1A0020555
	for <lists-other-nbd@bendel.debian.org>; Fri, 28 Apr 2023 01:15:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id EQg4xNhF_4iH for <lists-other-nbd@bendel.debian.org>;
	Fri, 28 Apr 2023 01:15:33 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pf1-x42c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2C26C20572
	for <nbd@other.debian.org>; Fri, 28 Apr 2023 01:15:32 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-63b8b927f62so1901891b3a.0
        for <nbd@other.debian.org>; Thu, 27 Apr 2023 18:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1682644529; x=1685236529;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdAMIiYmqSQz1GbWDTNHZpSZR6NUQD27x8IVMPn6Rlk=;
        b=sa+18BQfIXdO34J2oBZ5fSNZDw2+/e2xdxFJ6iVqaxb1QxklxwVdWMI6yAs6m/RXcG
         hfCvJZzISTfabi+tC/OLXZyJxmQaWFrefjil/FlgPAPMdVKcCqbLhRn+h8eIWvXlS8iJ
         /I/b9TjLaNJB9EVoYkWPxoRdY4h6oGKU7HwGje2SXoKok/o3pDz+eEsBMclToXbyGCZG
         mFWMsHrQiSG51MpgLF6Vm4jULI7sg02cU6J3SmaHgwSwUU0fEn/C0JuSqoGjF2+SJ95c
         LdX+qb1fRPWe/Sy/EGOigwFdj+uTAUfnCPj7I+qWoFvYbU7FOqL4/hDVkR0bpJetnn2J
         DT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682644529; x=1685236529;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdAMIiYmqSQz1GbWDTNHZpSZR6NUQD27x8IVMPn6Rlk=;
        b=Vc/pVQT0O7P6K2TdirQvNd7xemGYh0QWeVtTBcvb+YarRMuPbd0hJL1Ke9f06Vbf3n
         ippMZXk2zNf/J/H+r+pA5yLgITDfRaAkNhiTjVgJbK4uyGyTFEq0oMZwBKUT/ymvWG9V
         ipYhkEORsJHYUOg09lb+gmRoHYsJwpHDwVX347j2/IOV7UR6GcgF5QQ5mXnypw92VhRz
         R8bWsD6XhkTU4kZiCBdGY7hKkS6gkaHuQMpwF6Lxx+Ox5yHg3aFabyPJY8ICh3aV771s
         z4KFQdtiZcR2xnX96OKrrhbTRONuvam9njlrYaX0igRcc3u2ZsFp2Ss9nX+odx3mFz8Y
         4qmQ==
X-Gm-Message-State: AC+VfDyBJRayNMXSKkG/Aq2JjXOa1EIxsyW6UAtHL0XtuL6WFZBjxu+P
	1wz4HgbmC/bU7W2npBpm6hJIlA==
X-Google-Smtp-Source: ACHHUZ7X+opn2Ubw1AwkQMzsSBun7dBZmvM343LIKmA46Kxphf9kLViwUZGrEMzvdhctRRtKV/mFeQ==
X-Received: by 2002:a05:6a20:7f99:b0:f6:d60d:dbc8 with SMTP id d25-20020a056a207f9900b000f6d60ddbc8mr3325695pzj.2.1682644529298;
        Thu, 27 Apr 2023 18:15:29 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id om12-20020a17090b3a8c00b002405d3bbe42sm13893828pjb.0.2023.04.27.18.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 18:15:28 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, linux-block@vger.kernel.org, nbd@other.debian.org, 
 Eric Blake <eblake@redhat.com>
Cc: philipp.reisner@linbit.com, lars.ellenberg@linbit.com, 
 christoph.boehmwalder@linbit.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230410180611.1051618-1-eblake@redhat.com>
References: <20230410180611.1051618-1-eblake@redhat.com>
Subject: Re: [PATCH v3 0/4] nbd: s/handle/cookie/
Message-Id: <168264452819.133910.16210912670607469975.b4-ty@kernel.dk>
Date: Thu, 27 Apr 2023 19:15:28 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gReioWnSKfG.A.TdC.YJySkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2457
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/168264452819.133910.16210912670607469975.b4-ty@kernel.dk
Resent-Date: Fri, 28 Apr 2023 01:33:12 +0000 (UTC)


On Mon, 10 Apr 2023 13:06:07 -0500, Eric Blake wrote:
> v2 was here: https://lkml.org/lkml/2023/3/17/1107
> since then:
> - squash patch 2/5 and 3/5 into 3/4 [Ming]
> - add Josef's R-b
> - tweak commit messages to match commits in userspace NBD (code itself
>   is unchanged, modulo the patch squash)
> 
> [...]

Applied, thanks!

[1/4] uapi nbd: improve doc links to userspace spec
      commit: daf376a366fd2d469d66ab83dfdc074777462bab
[2/4] uapi nbd: add cookie alias to handle
      commit: 2686eb845da7762ee98b17e578b0c081aafb77b9
[3/4] block nbd: use req.cookie instead of req.handle
      commit: bd9e9916c32fd4b4fb4e879e05bd1568ee02ec93
[4/4] docs nbd: userspace NBD now favors github over sourceforge
      commit: 952aa344bf4305ab6fa0d9962ef8c2caa2afef4c

Best regards,
-- 
Jens Axboe




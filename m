Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE14DE7C9
	for <lists+nbd@lfdr.de>; Sat, 19 Mar 2022 13:12:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 341C62052C; Sat, 19 Mar 2022 12:12:49 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Mar 19 12:12:49 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B649A204DC
	for <lists-other-nbd@bendel.debian.org>; Sat, 19 Mar 2022 12:12:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id W0P-9gxbjCvw for <lists-other-nbd@bendel.debian.org>;
	Sat, 19 Mar 2022 12:12:35 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-ed1-x533.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 35C562050D
	for <nbd@other.debian.org>; Sat, 19 Mar 2022 12:12:34 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b15so13036217edn.4
        for <nbd@other.debian.org>; Sat, 19 Mar 2022 05:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UXX8e3K2DEh9oYlXA+HHN2i7FOjC5G9fn3MZK9hyfp8=;
        b=naxy5AfNzj214scomcYXXHnK5EcJoYtMZKgskhihPz2ZCGj/RXLj21NLK6WC3QQHCe
         tVfXXH5colKoVrGZJGQzFzVdNY+iIfGroaKO9t4OpjY2XRc+treqxh7fn3bKH9+2T7xU
         tmdx75m9crbRh0eBSksU28uDfXCfR4uVrmbSUOotukFkl16qNAJyeV9Xlg9JFoEi4NbH
         +ebL9oqsPg3lw0WrQkpS3pth//MFmwWCJL81Bnh6GKtwnhhzyILo+XI9+LJzjGNF6hpu
         KV5CZbrmyHUvjqG2DDt6IzZnPq8sRxj1yTNaP1RiEqw11QsyJzES3Dz3o4mcIHSs13ab
         N4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UXX8e3K2DEh9oYlXA+HHN2i7FOjC5G9fn3MZK9hyfp8=;
        b=qaDRd+r/IU4Led6sMi1TMYySCScWE6N+fSArs3QjUKTJOkwJlSEJGJjtc4b4jnyGiS
         vQJhhlG9fNSmipWnd0ZOwjy9LNFb3SqgxglM1a4U9VWQi4T8Qb0y8Oo/1BOaxKOGfEnp
         knZ1SW7FLwlAjXlUmGy7jywHPhi9IzvMaRxqPFI3O96At+O47gl5OCGhdwjJMFkwfwdd
         bidhZfGOc8YcFLjwkxmTbq4+tgB8ABdcMuag8ZYORWGhvRWtBigqXIYovnmg8OHVSemo
         VdyNl99UB79sJ3jRopDbFsD2OmYYGx0ZN2zqCw9MyX5/PkhuAU8Zwzjr0BrVi7JAeBq1
         yjQA==
X-Gm-Message-State: AOAM531gRt/iY3vZeGTQQ5jWe9QmPUrRcFCW8N3bW1YeqvrmmkD+ErVW
	PatuTJHKkG3TgPCCcZfsP+thV7I+SuKp8g==
X-Google-Smtp-Source: ABdhPJwNHivb4H7ZgBSBE5qr96QcOTM5EX389uvvXHK5+iu+CxKbkl3h8vgqGl4fb0vuBQE0vijphw==
X-Received: by 2002:a05:6402:3581:b0:418:ec68:f48e with SMTP id y1-20020a056402358100b00418ec68f48emr14184262edc.63.1647691950876;
        Sat, 19 Mar 2022 05:12:30 -0700 (PDT)
Received: from localhost.localdomain (p200300d9974079002dc18ae79cfc5336.dip0.t-ipconnect.de. [2003:d9:9740:7900:2dc1:8ae7:9cfc:5336])
        by smtp.googlemail.com with ESMTPSA id ch26-20020a0564021bda00b00418f99695f0sm3757757edb.23.2022.03.19.05.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 05:12:30 -0700 (PDT)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org,
	Wouter Verhelst <w@uter.be>
Cc: Manfred Spraul <manfred.spraul@de.bosch.com>,
	Manfred Spraul <manfred@colorfullife.com>
Subject: [PATCH 0/3] nbd-trplay,nbd-trdump updates
Date: Sat, 19 Mar 2022 13:12:24 +0100
Message-Id: <20220319121227.39165-1-manfred@colorfullife.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DvRoNpeFgBF.A.ngH.BjcNiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1738
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220319121227.39165-1-manfred@colorfullife.com
Resent-Date: Sat, 19 Mar 2022 12:12:49 +0000 (UTC)

Hi,

Rediffed against current git head from github, i.e. with the
cwrap changes.

Patch 1: Spelling & formatting corrections for proto.md

Patch 2: The discussed printf update, and a correction
         of an incorrect printf.

Patch 3: Test case for nbd-trplay.

The test works as intended from Fedora rpmbuild:
If I modify one of the md5sum values, the build fails.

@Wouter: Any further ideas?

I have not modified the "integrity read" output yet.
tests/run/nbd-tester-client.c:
>   ("%d: Integrity %s test complete. Took %.3f seconds to complete, %.3f%sib/s",
>          (int)getpid(), (testflags & TEST_WRITE) ? "write" : "read",

Unless I misread the code, the testflags parameter has no impact on the
integrity test.
If you want, I can update the text (remove write/read, perhaps add the
file name instead)

--
	Manfred

